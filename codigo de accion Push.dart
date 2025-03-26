// Dependencias: flutter_local_notifications y permission_handler ultima version
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> executePushNoti() async {
  try {
    // Solicitar permiso antes de mostrar la notificación
    PermissionStatus status = await Permission.notification.request();

    print("Permiso de notificación: $status");

    if (status != PermissionStatus.granted) {
      print(" Permiso de notificación denegado");
      return;
    }

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Configuración de inicialización
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // Usando ic_launcher

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Configurar detalles de la notificación
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'mi_canal_unico', // ID de canal único
      'Notificaciones Locales',
      channelDescription: 'Canal de prueba para notificaciones locales',
      importance: Importance.max, // Importancia máxima
      priority: Priority.max, // Prioridad máxima
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Agregar un retraso
    await Future.delayed(Duration(seconds: 1));

    // Mostrar la notificación
    print("Intentando mostrar la notificación..."); // Agregar este print
    await flutterLocalNotificationsPlugin.show(
      0,
      'Test Notificación',
      'Esto es un test de push notification en Android',
      platformChannelSpecifics,
    );
    print(
        "Notificación mostrada"); //Verificacion de que se muestra la notificacion
  } catch (e) {
    print("Error al mostrar la notificación: $e"); //Manejo de errores
  }
}