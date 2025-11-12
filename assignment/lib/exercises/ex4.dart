import 'package:flutter/material.dart';

enum WeatherOfLoc {
  phnompenh('lib/assets/assets/ex4/cloudy.png', '10.0', '30.0', '12.2'),
  paris('lib/assets/assets/ex4/sunnyCloudy.png', '10.0', '40.0', '22.2'),
  rome('lib/assets/assets/ex4/sunny.png', '10.0', '40.0', '45.2'),
  toulouse('lib/assets/assets/ex4/veryCloudy.png', '10.0', '40.0', '45.2');

  final String weatherImage;
  final String min;
  final String max;
  final String avg;

  const WeatherOfLoc(this.weatherImage, this.min, this.max, this.avg);
}

class Ex4 extends StatelessWidget {
  const Ex4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Weather Forecast'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            // fixed: EdgeInsetsGeometry.all(...) -> EdgeInsets.all(...)
            padding: const EdgeInsets.all(10),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: const [
                WeatherForecast(weather: WeatherOfLoc.phnompenh),
                WeatherForecast(
                  weather: WeatherOfLoc.paris,
                  gradientColors: [Color(0xFF93FFC0), Color(0xFF098258)],
                ),
                WeatherForecast(
                  weather: WeatherOfLoc.rome,
                  gradientColors: [Color(0xFFFF8383), Color(0xFF9F170D)],
                ),
                WeatherForecast(
                  weather: WeatherOfLoc.toulouse,
                  gradientColors: [Color(0xFFF2C582), Color(0xFFFFA143)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherForecast extends StatelessWidget {
  final WeatherOfLoc weather;
  final List<Color> gradientColors;

  const WeatherForecast({
    super.key,
    required this.weather,
    // small change: adjusted default gradient to teal/blue
    this.gradientColors = const [Color(0xFF6DD5FA), Color(0xFF2980B9)],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: gradientColors),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(79, 0, 0, 0),
            blurRadius: 5,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(weather.weatherImage),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Min : ${weather.min} °C',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Max : ${weather.max} °C',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -10,
                bottom: -60,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: gradientColors),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                '${weather.avg}°C',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
