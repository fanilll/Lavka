using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using LavkaApp1.Components;

namespace LavkaApp1
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static LavkaBaseEntities db = new LavkaBaseEntities();
        public static Users loginedUsers;
    }
}
