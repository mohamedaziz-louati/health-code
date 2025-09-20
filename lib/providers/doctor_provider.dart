import 'package:flutter/foundation.dart';
import 'package:health_code/models/doctor.dart';

class DoctorProvider with ChangeNotifier {
  List<Doctor> _doctors = [];
  List<Doctor> _filteredDoctors = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';
  String _selectedSpecialization = '';

  List<Doctor> get doctors => _filteredDoctors.isNotEmpty ? _filteredDoctors : _doctors;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get searchQuery => _searchQuery;
  String get selectedSpecialization => _selectedSpecialization;

  List<String> get specializations => [
    'Cardiology',
    'Dermatology',
    'Neurology',
    'Orthopedics',
    'Pediatrics',
    'Psychiatry',
    'Gynecology',
    'General Medicine',
    'Dentistry',
    'Ophthalmology',
  ];

  Future<void> loadDoctors() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock doctor data
      _doctors = [
        Doctor(
          id: '1',
          name: 'Dr. Sarah Johnson',
          specialization: 'Cardiology',
          hospital: 'City General Hospital',
          experience: '10 years',
          rating: 4.8,
          reviewCount: 156,
          profileImageUrl: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=150',
          bio: 'Experienced cardiologist specializing in heart disease prevention and treatment.',
          languages: ['English', 'Spanish'],
          availability: {
            'Monday': ['09:00', '10:00', '11:00', '14:00', '15:00'],
            'Tuesday': ['09:00', '10:00', '11:00', '14:00', '15:00'],
            'Wednesday': ['09:00', '10:00', '11:00'],
            'Thursday': ['09:00', '10:00', '11:00', '14:00', '15:00'],
            'Friday': ['09:00', '10:00', '11:00'],
          },
          consultationFee: 150.0,
          location: 'Downtown Medical Center',
          phone: '+1-555-0123',
          email: 'sarah.johnson@hospital.com',
        ),
        Doctor(
          id: '2',
          name: 'Dr. Michael Chen',
          specialization: 'Dermatology',
          hospital: 'Skin Care Clinic',
          experience: '8 years',
          rating: 4.6,
          reviewCount: 89,
          profileImageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=150',
          bio: 'Board-certified dermatologist with expertise in cosmetic and medical dermatology.',
          languages: ['English', 'Mandarin'],
          availability: {
            'Monday': ['10:00', '11:00', '14:00', '15:00', '16:00'],
            'Tuesday': ['10:00', '11:00', '14:00', '15:00'],
            'Wednesday': ['10:00', '11:00', '14:00', '15:00', '16:00'],
            'Thursday': ['10:00', '11:00', '14:00', '15:00'],
            'Friday': ['10:00', '11:00', '14:00', '15:00', '16:00'],
          },
          consultationFee: 120.0,
          location: 'Beauty & Health Center',
          phone: '+1-555-0124',
          email: 'michael.chen@skinclinic.com',
        ),
        Doctor(
          id: '3',
          name: 'Dr. Emily Rodriguez',
          specialization: 'Pediatrics',
          hospital: 'Children\'s Hospital',
          experience: '12 years',
          rating: 4.9,
          reviewCount: 203,
          profileImageUrl: 'https://images.unsplash.com/photo-1594824388852-7b308a1d3f8d?w=150',
          bio: 'Pediatrician dedicated to providing comprehensive care for children of all ages.',
          languages: ['English', 'Spanish', 'French'],
          availability: {
            'Monday': ['08:00', '09:00', '10:00', '11:00', '14:00'],
            'Tuesday': ['08:00', '09:00', '10:00', '11:00', '14:00'],
            'Wednesday': ['08:00', '09:00', '10:00', '11:00'],
            'Thursday': ['08:00', '09:00', '10:00', '11:00', '14:00'],
            'Friday': ['08:00', '09:00', '10:00', '11:00'],
          },
          consultationFee: 100.0,
          location: 'Family Health Center',
          phone: '+1-555-0125',
          email: 'emily.rodriguez@childrenshospital.com',
        ),
        Doctor(
          id: '4',
          name: 'Dr. David Kim',
          specialization: 'Orthopedics',
          hospital: 'Sports Medicine Center',
          experience: '15 years',
          rating: 4.7,
          reviewCount: 134,
          profileImageUrl: 'https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=150',
          bio: 'Orthopedic surgeon specializing in sports injuries and joint replacement.',
          languages: ['English', 'Korean'],
          availability: {
            'Monday': ['09:00', '10:00', '11:00', '14:00', '15:00', '16:00'],
            'Tuesday': ['09:00', '10:00', '11:00', '14:00', '15:00'],
            'Wednesday': ['09:00', '10:00', '11:00', '14:00', '15:00', '16:00'],
            'Thursday': ['09:00', '10:00', '11:00', '14:00', '15:00'],
            'Friday': ['09:00', '10:00', '11:00', '14:00', '15:00', '16:00'],
          },
          consultationFee: 180.0,
          location: 'Athletic Performance Center',
          phone: '+1-555-0126',
          email: 'david.kim@sportsmedicine.com',
        ),
        Doctor(
          id: '5',
          name: 'Dr. Lisa Thompson',
          specialization: 'Neurology',
          hospital: 'Brain & Spine Institute',
          experience: '11 years',
          rating: 4.8,
          reviewCount: 167,
          profileImageUrl: 'https://images.unsplash.com/photo-1551601651-2a8555f1a136?w=150',
          bio: 'Neurologist with expertise in treating neurological disorders and conditions.',
          languages: ['English'],
          availability: {
            'Monday': ['09:00', '10:00', '11:00', '14:00', '15:00'],
            'Tuesday': ['09:00', '10:00', '11:00', '14:00', '15:00'],
            'Wednesday': ['09:00', '10:00', '11:00'],
            'Thursday': ['09:00', '10:00', '11:00', '14:00', '15:00'],
            'Friday': ['09:00', '10:00', '11:00'],
          },
          consultationFee: 200.0,
          location: 'Neurological Center',
          phone: '+1-555-0127',
          email: 'lisa.thompson@brainspine.com',
        ),
      ];
      
    } catch (e) {
      _error = 'Failed to load doctors. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  void searchDoctors(String query) {
    _searchQuery = query;
    _filteredDoctors = _doctors.where((doctor) {
      return doctor.name.toLowerCase().contains(query.toLowerCase()) ||
             doctor.specialization.toLowerCase().contains(query.toLowerCase()) ||
             doctor.hospital.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }

  void filterBySpecialization(String specialization) {
    _selectedSpecialization = specialization;
    if (specialization.isEmpty) {
      _filteredDoctors = [];
    } else {
      _filteredDoctors = _doctors.where((doctor) {
        return doctor.specialization == specialization;
      }).toList();
    }
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _selectedSpecialization = '';
    _filteredDoctors = [];
    notifyListeners();
  }

  Doctor? getDoctorById(String id) {
    try {
      return _doctors.firstWhere((doctor) => doctor.id == id);
    } catch (e) {
      return null;
    }
  }
}
