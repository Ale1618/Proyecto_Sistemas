import 'package:flutter/material.dart';

Color primaryBlack = Color(0xff202c3b);


class DataSource{
  static String quote = "... el virus azola nuestra raza, todos juntos combatimos desde casa, miro al cielo no veo el humo, es el momento, es nuestro turno." "\n" "Jose Pastor-Distopía.";

  static List preguntasRespuestas = [
    {
      "pregunta": "Qué es el coronavirus",
      "respuesta":
          "Los coronavirus son una extensa familia de virus que pueden causar enfermedades tanto en animales como en humanos. En los humanos, se sabe que varios coronavirus causan infecciones respiratorias que pueden ir desde el resfriado común hasta enfermedades más graves como el síndrome respiratorio de Oriente Medio (MERS) y el síndrome respiratorio agudo severo (SRAS). El coronavirus que se ha descubierto más recientemente causa la enfermedad por coronavirus COVID-19."
    },
    {
      "pregunta": "¿Por qué a la enfermedad la llaman enfermedad del coronavirus 2019 (COVID-19)?",
      "respuesta":
      "El 11 de febrero del 2020, la Organización Mundial de la Salud anunció  el nombre oficial de la enfermedad que está causando el brote del nuevo coronavirus 2019 y que se identificó por primera vez en Wuhan, China. El nuevo nombre de la enfermedad es enfermedad del coronavirus 2019, y su forma abreviada es COVID-19. En el COVID-19, 'CO' corresponde a 'corona', 'VI' a 'virus' y 'D' a 'disease' (enfermedad).  Antes, la forma de referirse a esta enfermedad era 'nuevo coronavirus 2019' o '2019-nCoV'. xiste muchos tipos de coronavirus humanos, incluidos algunos que comúnmente causan enfermedades leves en las vías respiratorias superiores. El COVID-19 es una nueva enfermedad, causada por un nuevo coronavirus que no se había visto anteriormente en seres humanos. El nombre de esta enfermedad se eligió siguiendo las  mejores prácticasícono de sitio externoícono de sitio externo establecidas por la Organización Mundial de la Salud (OMS) para denominar nuevas enfermedades infecciosas en seres humanos."
    },
    {
      "pregunta": "Cúales son los sintomas del COVID-19",
      "respuesta":
      "Los síntomas más comunes incluyen fiebre, tos, y sensación de falta de aire. En algunos casos también puede haber síntomas digestivos como diarrea y dolor abdominal. La mayoría de los casos presentan síntomas leves, sobre todo en niños y adultos jóvenes. En casos más graves, la infección puede causar neumonía, dificultad importante para respirar, fallo renal e incluso la muerte. Los casos más graves generalmente ocurren en personas de edad avanzada o que padecen alguna enfermedad crónica, como enfermedades del corazón, del pulmón o inmunodeficiencias."
    },
    {
      "pregunta": "¿Cuándo aparecen los síntomas de la COVID-19?",
      "respuesta":
      "El período de incubación es el tiempo que transcurre entre la infección por el virus y la aparición de los síntomas de la enfermedad. La mayoría de las estimaciones respecto al periodo de incubación de la COVID-19 oscilan entre 1 y 14 días, y en general se sitúan en torno a 5-6 días."
    },
    {
      "pregunta": "¿Cuánto duran los síntomas de la COVID-19?",
      "respuesta":
      "El tiempo medio desde el inicio de los síntomas hasta la recuperación es de 2 semanas cuando la enfermedad ha sido leve y 3-6 semanas cuando ha sido grave o crítica."
    },
    {
      "pregunta": "¿Cuáles son los grupos vulnerables?",
      "respuesta":
      "Los principales grupos vulnerables son los mayores de 60 años, hipertensión arterial, diabetes, enfermedades cardiovasculares, enfermedades pulmonares crónicas, cáncer, inmunodeficiencias, y el embarazo por el principio de precaución."
    },
    {
      "pregunta": "¿Cómo se transmite el nuevo coronavirus?",
      "respuesta":
      "Parece que la transmisión es por contacto estrecho con las secreciones respiratorias que se generan con la tos o el estornudo de una persona enferma. Su contagiosidad depende de la cantidad del virus en las vías respiratorias. Estas secreciones infectarían a otra persona si entran en contacto con su nariz, sus ojos o su boca. Parece poco probable la transmisión por el aire a distancias mayores de uno o dos metros. El riesgo de contraer la COVID-19 de alguien que no presente ningún síntoma es muy bajo. Sin embargo, muchas personas que contraen la COVID-19 solo presentan síntomas leves. Esto es particularmente cierto en las primeras etapas de la enfermedad. Por lo tanto, es posible contagiarse de alguien que, por ejemplo, solamente tenga una tos leve y no se sienta enfermo. Se están realizando investigaciones en curso sobre el periodo de transmisión de la COVID-19 y se obtendrán datos más detallados sobre esta cuestión."
    },
    {
      "pregunta": "¿Es posible volverse a contagiar por el virus?",
      "respuesta":
      "Actualmente no existe evidencia suficiente que permita afirmar que una persona que ha pasado la enfermedad pueda volver a infectarse. No obstante, en infecciones causadas por virus similares, como el SARS, se observó que los pacientes afectados desarrollaban inmunidad frente a la enfermedad, al menos a corto plazo. Si bien se han descrito casos de pacientes infectados por coronavirus que volvieron a dar positivos en los test una vez fueron dados de alta, esto podría deberse a errores en la toma de muestra o a pacientes con recuperación prolongada que permanecieron asintomáticos."
    },
    {
      "pregunta": "¿Son lo mismo la COVID-19 y el SARS?",
      "respuesta":
      "No. El genoma del virus que causa la COVID-19 y el del responsable del síndrome respiratorio agudo severo (SARS) son similares, pero no iguales. El SARS es más letal pero mucho menos infeccioso que la COVID-19. Desde 2003, no se han registrado brotes de SARS en ningún lugar del mundo."
    },
    {
      "pregunta": "¿Existe alguna vacuna?",
      "respuesta":
      "Por el momento, tampoco se dispone de vacuna que proteja frente a la COVID-19, pero se están realizando estudios clínicos con diversos candidatos, y sería previsible que en un plazo prudente de tiempo (1-2 años) se autorice alguna vacuna frente al nuevo coronavirus. Por tanto, la forma más eficaz de protegerse es seguir las recomendaciones de higiene y distancia."
    },
    {
      "pregunta": "¿Son eficaces los antibióticos para prevenir o tratar el COVID-19?",
      "respuesta":
      "No. La norma general que debemos recordar es que los antibióticos no son eficaces contra los virus, solo contra las infecciones bacterianas. La COVID-19 está causada por un virus, de modo que los antibióticos no sirven frente a ella. No se deben usar antibióticos como medio de prevención o tratamiento de la COVID-19. Solo deben usarse para tratar una infección bacteriana siguiendo las indicaciones de un médico."
    },
    {
      "pregunta": "¿Mi mascota me puede contagiar la COVID-19?",
      "respuesta":
      "Aunque ha habido un caso de un perro infectado en Hong Kong, hasta la fecha no hay pruebas de que un perro, un gato o cualquier mascota pueda transmitir la COVID-19."
    },
  ];
}