module CalcGroupDayRangeService
  class Calc
    def initialize(cutoff_record)
      @cutoff = cutoff_record.time
      @now = Time.zone.now
      daylight_saving_begin = cutoff_record.daylight_saving_begin
      daylight_saving_end = cutoff_record.daylight_saving_end
      #當年夏令時開始時間
      @daylight_begin = Time.zone.local(@now.year, daylight_saving_begin.month,
                                        daylight_saving_begin.day, daylight_saving_begin.hour,
                                        daylight_saving_begin.min, daylight_saving_begin.sec)
      #當年夏令時結束時間
      @daylight_end = Time.zone.local(@now.year, daylight_saving_end.month,
                                      daylight_saving_end.day, daylight_saving_end.hour,
                                      daylight_saving_end.min, daylight_saving_end.sec)

      @cutoff_wtime = @cutoff - @cutoff.beginning_of_week
      @now_wtime = @now - @now.beginning_of_week
    end
    def current_cut_off_week(offset_weeks: 0)
      if @now_wtime >= @cutoff_wtime
        cutoff_begin = @now.beginning_of_week + @cutoff_wtime
        cutoff_end = cutoff_begin + 1.week
      else
        cutoff_end = @now.beginning_of_week + @cutoff_wtime
        cutoff_begin  = cutoff_end - 1.week
      end

      [cutoff_begin + offset_weeks.week, cutoff_end + offset_weeks.week]
    end
    def current_cut_off_week_with_daylight_saving
      cutoff_begin, cutoff_end = current_cut_off_week
      if cutoff_begin > @daylight_begin && cutoff_begin < @daylight_end
        cutoff_begin = cutoff_begin + 1.hour  # 默認撥快一小時
      end
      if cutoff_end > @daylight_begin && cutoff_end < @daylight_end
        cutoff_end = cutoff_end + 1.hour
      end
      [cutoff_begin, cutoff_end]
    end
  end
end