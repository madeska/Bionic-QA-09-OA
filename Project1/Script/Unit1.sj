function Test1()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.Edit.Keys("hello");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.dlgSaveAs.SaveFile("C:\\123", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "hello", false);
  Aliases.notepad.wndNotepad.Close();
}

function Test2_1()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\123.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.Edit.Keys("11");
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.wndNotepad.Close();
}

function Test2_2()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\123.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, "11hello", false);
  Aliases.notepad.wndNotepad.Close();
}

function PostConditions()
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.SHELLDLL_DefView.FolderView.ClickItem("123");
  Aliases.notepad.dlgOpen.SHELLDLL_DefView.FolderView.ClickItemR("123");
  Aliases.notepad.dlgOpen.SHELLDLL_DefView.FolderView.PopupMenu.Click("Delete");
  Aliases.notepad.dlgConfirmFileDelete.btnYes.ClickButton();
  Aliases.notepad.dlgOpen.Close();
  Aliases.notepad.wndNotepad.Close();
}
