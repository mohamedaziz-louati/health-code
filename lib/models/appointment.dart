import 'doctor.dart';
import 'user.dart';

enum AppointmentStatus {
  pending,
  confirmed,
  completed,
  cancelled,
}

class Appointment {
  final String id;
  final String userId;
  final String doctorId;
  final DateTime appointmentDate;
  final String timeSlot;
  final AppointmentStatus status;
  final String? notes;
  final DateTime createdAt;
  final Doctor? doctor;
  final User? user;

  Appointment({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentDate,
    required this.timeSlot,
    required this.status,
    this.notes,
    required this.createdAt,
    this.doctor,
    this.user,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      userId: json['userId'],
      doctorId: json['doctorId'],
      appointmentDate: DateTime.parse(json['appointmentDate']),
      timeSlot: json['timeSlot'],
      status: AppointmentStatus.values.firstWhere(
        (e) => e.toString() == 'AppointmentStatus.${json['status']}',
        orElse: () => AppointmentStatus.pending,
      ),
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'doctorId': doctorId,
      'appointmentDate': appointmentDate.toIso8601String(),
      'timeSlot': timeSlot,
      'status': status.toString().split('.').last,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'doctor': doctor?.toJson(),
      'user': user?.toJson(),
    };
  }

  Appointment copyWith({
    String? id,
    String? userId,
    String? doctorId,
    DateTime? appointmentDate,
    String? timeSlot,
    AppointmentStatus? status,
    String? notes,
    DateTime? createdAt,
    Doctor? doctor,
    User? user,
  }) {
    return Appointment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      doctorId: doctorId ?? this.doctorId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      timeSlot: timeSlot ?? this.timeSlot,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      doctor: doctor ?? this.doctor,
      user: user ?? this.user,
    );
  }
}
