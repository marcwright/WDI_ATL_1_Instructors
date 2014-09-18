balance1 = 0
balance2 = 0

$ ->
  $('#deposit1').click(depositAccount1)
  $('#deposit2').click(depositAccount2)
  $('#withdraw1').click(withdrawAccount1)
  $('#withdraw2').click(withdrawAccount2)
  updateDisplay()

depositAccount1 = ->
  amount = $('#amount1').val()
  amount = parseInt(amount)
  if not isNaN(amount)
    balance1 = amount + balance1
    updateDisplay()

depositAccount2 = ->
  amount = $('#amount2').val()
  amount = parseInt(amount)
  if not isNaN(amount)
    balance2 = amount + balance2
    updateDisplay()

withdrawAccount1 = ->
  amount = $('#amount1').val()
  amount = parseInt(amount)
  balances = withdrawFunds(amount, balance1, balance2)
  balance1 = balances[0]
  balance2 = balances[1]
  updateDisplay()

withdrawAccount2 = ->
  amount = $('#amount2').val()
  amount = parseInt(amount)
  balances = withdrawFunds(amount, balance2, balance1)
  balance2 = balances[0]
  balance1 = balances[1]
  updateDisplay()

withdrawFunds = (amount, primary, secondary) ->
  if not isNaN(amount) and amount <= primary
    primary = primary - amount;
  else if (amount > primary) and (amount <= (secondary + primary))
    secondary = (primary + secondary) - amount
    primary = 0

  [primary, secondary]

updateDisplay = ->
  if balance1 <= 0
    $('#balance1').addClass('zero')
  else
    $('#balance1').removeClass('zero')

  if balance2 <= 0
    $('#balance2').addClass('zero')
  else
    $('#balance2').removeClass('zero')

  $('#balance1').text('$' + balance1)
  $('#balance2').text('$' + balance2)
  $('#amount1').val('')
  $('#amount2').val('')
