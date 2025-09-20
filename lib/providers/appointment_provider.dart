import 'package:flutter/foundation.dart';
import 'package:health_code/models/appointment.dart';

class AppointmentProvider with ChangeNotifier {
  List<Appointment> _appointments = [];
  bool _isLoading = false;
  String? _error;

  List<Appointment> get appointments => _appointments;
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<Appointment> get upcomingAppointments {
    final now = DateTime.now();
    return _appointments.where((appointment) {
      return appointment.appointmentDate.isAfter(now) &&
             appointment.status != AppointmentStatus.cancelled;
    }).toList();
  }

  List<Appointment> get pastAppointments {
    final now = DateTime.now();
    return _appointments.where((appointment) {
      return appointment.appointmentDate.isBefore(now) ||
             appointment.status == AppointmentStatus.completed;
    }).toList();
  }

  Future<void> loadAppointments(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock appointment data
      _appointments = [
        Appointment(
          id: '1',
          userId: userId,
          doctorId: '1',
          appointmentDate: DateTime.now().add(const Duration(days: 2)),
          timeSlot: '10:00',
          status: AppointmentStatus.confirmed,
          notes: 'Regular checkup',
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
        ),
        Appointment(
          id: '2',
          userId: userId,
          doctorId: '2',
          appointmentDate: DateTime.now().add(const Duration(days: 7)),
          timeSlot: '14:00',
          status: AppointmentStatus.pending,
          notes: 'Skin consultation',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
        Appointment(
          id: '3',
          userId: userId,
          doctorId: '3',
          appointmentDate: DateTime.now().subtract(const Duration(days: 5)),
          timeSlot: '09:00',
          status: AppointmentStatus.completed,
          notes: 'Child vaccination',
          createdAt: DateTime.now().subtract(const Duration(days: 10)),
        ),
      ];
      
    } catch (e) {
      _error = 'Failed to load appointments. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> bookAppointment({
    required String userId,
    required String doctorId,
    required DateTime appointmentDate,
    required String timeSlot,
    String? notes,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      final newAppointment = Appointment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: userId,
        doctorId: doctorId,
        appointmentDate: appointmentDate,
        timeSlot: timeSlot,
        status: AppointmentStatus.pending,
        notes: notes,
        createdAt: DateTime.now(),
      );

      _appointments.add(newAppointment);
      
    } catch (e) {
      _error = 'Failed to book appointment. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> cancelAppointment(String appointmentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      final index = _appointments.indexWhere((apt) => apt.id == appointmentId);
      if (index != -1) {
        _appointments[index] = _appointments[index].copyWith(
          status: AppointmentStatus.cancelled,
        );
      }
      
    } catch (e) {
      _error = 'Failed to cancel appointment. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> rescheduleAppointment({
    required String appointmentId,
    required DateTime newDate,
    required String newTimeSlot,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      final index = _appointments.indexWhere((apt) => apt.id == appointmentId);
      if (index != -1) {
        _appointments[index] = _appointments[index].copyWith(
          appointmentDate: newDate,
          timeSlot: newTimeSlot,
          status: AppointmentStatus.pending,
        );
      }
      
    } catch (e) {
      _error = 'Failed to reschedule appointment. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
