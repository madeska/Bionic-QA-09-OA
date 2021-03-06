function main()    // Four test-scripts run in sequence
{
preparetion();
newOrder();
CleanOrders();
closeApp();
}
function preparetion()   // Preconditions: Orders.exe runs
{     var App=TestedApps.Orders;
      App.Run();   
}

function newOrder()
{ var OrderField=Aliases.System.Orders.OrderForm.Group;    
  var ProductNames=OrderField.ProductNames;
  var city=OrderField.City;
  var date=OrderField.Date;
  var Quantity=OrderField.Quantity;
  var CustomerName=OrderField.Customer;
  var street=OrderField.Street;
  var State=OrderField.State;
  var Zip=OrderField.Zip;
  var CardNumber=OrderField.CardNo;
  var ExpDate=OrderField.ExpDate;   
  var driver=DDT.CSVDriver(Files.FileNameByName("input.txt"));
                    
  while(!driver.EOF())
  { 
  Aliases.System.Orders.MainForm.MainMenu.Click("Orders|New order...");
  Log.AppendFolder(driver.Value(1))
  ProductNames.ClickItem(driver.Value(0));   
  Quantity.wValue = driver.Value(1);
  date.wDate = driver.Value(2);
  CustomerName.wText = driver.Value(3);
  street.wText = driver.Value(4);
  city.wText =driver.Value(5);
  State.wText = driver.Value(6);
  Zip.wText = driver.Value(7);
  //OrderField.driver.Value(8).ClickButton();
  CardNumber.wText=driver.Value(9)
  ExpDate.wDate = driver.Value(10);
  Aliases.System.Orders.OrderForm.ButtonOK.Click() ;
  
    if (Aliases.System.Orders.dlgWarning.Exists) 
    Aliases.System.Orders.dlgWarning.btnOK.click();
  Aliases.System.Orders.MainForm.OrdersView.DblClickItem(driver.Value(3)); 
  aqObject.CompareProperty(CustomerName.wText, 0, driver.Value(3), false);
  Log.PopLogFolder();
  Aliases.System.Orders.OrderForm.ButtonOK.ClickButton(); 
  driver.Next();
  }  
} 

function CleanOrders()   //delete all orders
{ 
  var i=0;
  while(i<5)
  {
  Aliases.System.Orders.MainForm.OrdersView.Keys("[Del]");
  Aliases.System.Orders.Confirm_msg.btnYes.ClickButton();
  i++;
  }
}
function closeApp()   //orders.exe closed without savingw
{
TestedApps.Orders.Close();
Aliases.System.Orders.Confirm_msg.btnNo.ClickButton();
}


