require "test_helper"

class CalcGroupDayRangeServiceTest < ActionDispatch::IntegrationTest
  setup do
    Cutoff.create(
      time: Time.zone.local(2021, 6, 9),
      daylight_saving_begin: Time.zone.local(2020, 3, 1),
      daylight_saving_end: Time.zone.local(2020, 10, 1)
    )
  end
  test "current_cut_off_week_with_daylight_saving" do
    begin_time_with_daylight_saving, end_time_with_daylight_saving = CalcGroupDayRangeService::Calc
                                                                       .new(Cutoff.first)
                                                                       .current_cut_off_week_with_daylight_saving
    begin_time, end_time = CalcGroupDayRangeService::Calc
                             .new(Cutoff.first).current_cut_off_week
    assert_equal begin_time + 1.hour, begin_time_with_daylight_saving
  end
end
