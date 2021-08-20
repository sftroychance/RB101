actions_en = <<-MSG
What action would you like to perform?
1) add
2) subtract
3) multiply
4) divide
MSG

actions_es = <<-MSG
¿Qué acción te gustaría realizar?
1) agregar
2) sustraer
3) multiplicar
4) dividir
MSG

MESSAGE = {
  welcome:      { en: 'Welcome to Calculator! Enter your name:',
                  es: '¡Bienvenido a la calculadora!  Introduzca su nombre' },
  greet:        { en: 'Welcome',
                  es: '¡Hola' },
  name_err:     { en: 'Make sure to use a valid name.',
                  es: 'Ingrese un nombre valido' },
  first_num:    { en: 'What is the first number?',
                  es: '¿Cual es el primer numero?' },
  second_num:   { en: 'What is the second number?',
                  es: '¿Cual es el segundo numero?' },
  num_error:    { en: "Hmmm...that doesn't look like a valid number",
                  es: 'Ese no es un numero valido' },
  which_action: { en: actions_en,
                  es: actions_es },
  action_error: { en: 'Must choose 1, 2, 3, or 4',
                  es: 'Debes elegir 1, 2, 3 o 4'},
  continue:     { en: 'Do you want to perform another calculation? (Y if yes)',
                  es: '¿Quieres realizar otro cálculo? (Y if sí)' },
  goodbye:      { en: 'Thank you for using calculator! Goodbye!',
                  es: '¡Gracias por usar la calculadora! ¡Adiós!' },
  operation:    { en: ['Adding', 'Subtracting', 'Multiplying', 'Dividing'],
                  es: ['Sumando', 'Restando', 'Multiplicando', 'Dividiendo']},
  oper_pred:    { en: 'the two numbers',
                  es: 'los dos números'},
  result:       { en: 'The result is',
                  es: 'El resultado es'}
}
