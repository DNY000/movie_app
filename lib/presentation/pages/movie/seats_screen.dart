import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/presentation/routes/name_router.dart';

class SeatsScreen extends StatefulWidget {
  const SeatsScreen({super.key});

  @override
  State<SeatsScreen> createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  late DateTime currentMonth;
  late List<DateTime> daysInMonth;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime.now();
    _generateDays();
    selectedDate = DateTime.now();
  }

  void _generateDays() {
    final today = DateTime.now();
    final firstDay = DateTime(
      currentMonth.year,
      currentMonth.month,
      currentMonth.month == today.month ? today.day : 1,
    );
    final lastDay = DateTime(currentMonth.year, currentMonth.month + 1, 0);

    daysInMonth = List.generate(
      lastDay.day - firstDay.day + 1,
      (i) => DateTime(currentMonth.year, currentMonth.month, firstDay.day + i),
    );
  }

  void _changeMonth(int offset) {
    setState(() {
      currentMonth = DateTime(
        currentMonth.year,
        currentMonth.month + offset,
        1,
      );
      _generateDays();
      selectedDate = daysInMonth.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 56),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'Selected Seats'),
            const SizedBox(height: 16),

            // Cinema info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'CGV Pearl Plaza',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          'CGV Pearl Plaza',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Date selector
            Text(
              'Date',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _changeMonth(-1),
                  icon: SvgPicture.asset('assets/icons/arrow_left.svg'),
                ),
                const SizedBox(width: 4),
                Text(
                  "${currentMonth.month}/${currentMonth.year}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  onPressed: () => _changeMonth(1),
                  icon: SvgPicture.asset('assets/icons/arrow_right.svg'),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final date = daysInMonth[index];
                  return DayOfMonthWidget(
                    date: date,
                    isSelected:
                        selectedDate?.day == date.day &&
                        selectedDate?.month == date.month &&
                        selectedDate?.year == date.year,
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemCount: daysInMonth.length,
              ),
            ),
            const SizedBox(height: 16),

            // Time selector
            Text(
              'Time',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kGreyColor.withOpacity(0.2),
                    ),
                    child: Text(
                      '08:00',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemCount: 10,
              ),
            ),

            // Seat selector
            SeatWidget(),

            const SizedBox(height: 24),
            Center(
              child: Text(
                '240.000đ for 2 tickets',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            GradientButton(
              width: double.infinity,
              onPressed: () => context.push(NameRouter.checkoutDetail),
              child: Text(
                'Book now',
                style: TextStyle(fontSize: 16.sp, color: kDarkTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DayOfMonthWidget extends StatelessWidget {
  const DayOfMonthWidget({
    super.key,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  String get weekDayName {
    const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return days[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: isSelected ? kGradient : null,
          color: !isSelected ? kGreyColor.withOpacity(0.2) : null,
        ),
        child: Column(
          children: [
            Text(
              weekDayName,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: isSelected ? kDarkTextColor : Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${date.day}/${date.month}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: isSelected ? kDarkTextColor : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== SeatWidget ====================
class SeatWidget extends StatelessWidget {
  SeatWidget({super.key});

  final List<List<int>> seatList = [
    [0, 0, 0, 0, 0, 0, 0], // Row 1
    [0, 0, 0, 0, 0, 0, 0, 0], // Row 2
    [0, 0, 0, 0, 0, 0, 0, 0], // Row 3
    [0, 0, 0, 0, 0, 0], // Row 4
  ];

  final Map<int, Color> seatColors = {
    0: Colors.white, // available
    1: Colors.grey, // booked
    2: Colors.yellow, // selected
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kGreyColor.withOpacity(0.2),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Column(
            children: List.generate(seatList.length, (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(seatList[rowIndex].length, (index) {
                  final seatStatus = seatList[rowIndex][index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/icons/seat.svg',
                      colorFilter: ColorFilter.mode(
                        seatColors[seatStatus] ?? Colors.white,
                        BlendMode.srcIn,
                      ),
                      width: 24,
                      height: 24,
                    ),
                  );
                }),
              );
            }),
          ),
          const SizedBox(height: 8),
          const Divider(color: kGreyColor, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLegendItem(Colors.white, "Available"),
                _buildLegendItem(kGreyColor.withOpacity(0.2), "Booked"),
                _buildLegendItem(kYellowColor, "Selected"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          height: 16.w,
          width: 16.w,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 14.sp, color: kGreyColor)),
      ],
    );
  }
}
