module CalcGroupDayRangeService
  class Calc
    def initialize(cutoff_record)
      @cutoff = cutoff_record.time
      @daylight_begin = cutoff_record.daylight_saving_begin
      @daylight_end = cutoff_record.daylight_saving_end
      @now = Time.zone.now
      #cutoffssdjsjljjj jjkjjjjljljljjlj
      @cutoff_wtime = @cutoff - @cutoff.beginning_of_week
      @now_wtime = @now - @now.beginning_of_week
    end
    def current_cut_off_week
      if @now_wtime >= @cutoff_wtime









    end


  end
end