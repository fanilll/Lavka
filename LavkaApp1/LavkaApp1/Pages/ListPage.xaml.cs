using LavkaApp1.Components;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace LavkaApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для ListPage.xaml
    /// </summary>
    public partial class ListPage : Page
    {
        public static List<Masters> masters { get; set; }
        private int pageNumber = 1;
        private int pageCount = 1;
        private List<Services> allServices = new List<Services>();
        public ListPage()
        {
            InitializeComponent();
            masters = new List<Masters>(App.db.Masters.ToList());
            var filter = App.db.Collections.ToList();
            filter.Insert(0, new Collections { Name = "Все коллекции" });
            CollectionCB.ItemsSource = filter;
            Refresh();
        }

        private void Refresh()
        {
            LVServices.SelectionMode = SelectionMode.Multiple;

            allServices = App.db.Services.ToList();

            // Создаем список продуктов
            var serviceList = allServices.Select(p => new
            {
                Title = p.Name,
                Description = p.Description ,
                CollectionName = App.db.Collections.FirstOrDefault(x => x.CollectionID == p.CollectionID).Name,
                Cost = p.Price,
            }).ToList();

            // Поиск
            var searchText = SearchTB.Text.ToLower();
            if (!string.IsNullOrWhiteSpace(searchText))
            {
                serviceList = serviceList.Where(x =>
                    x.Title.ToLower().Contains(searchText) ||
                    (x.Description?.ToLower().Contains(searchText) ?? false)
                ).ToList();
            }

            // Фильтрация
            var typeFilter = CollectionCB.SelectedItem as Collections;
            if (typeFilter != null && CollectionCB.SelectedIndex != 0)
            {
                serviceList = serviceList.Where(x => x.CollectionName == typeFilter.Name).ToList();
            }



            // Пересчитываем количество страниц после фильтрации и сортировки
            pageCount = serviceList.Count % 3 > 0 ? serviceList.Count / 3 + 1 : serviceList.Count / 3;

            // Корректируем номер страницы, если он выходит за границы
            if (pageNumber > pageCount)
                pageNumber = pageCount;
            if (pageNumber < 1)
                pageNumber = 1;

            // Применяем постраничный вывод только после всех фильтров и сортировок
            serviceList = serviceList.Skip((pageNumber - 1) * 20).Take(20).ToList();


            NavSp.Children.Clear(); // Очищаем старые кнопки

            if (pageCount > 1)
            {
                Button button1 = new Button
                {
                    Content = "<",
                    IsHitTestVisible = pageNumber > 1,
                    Background = new SolidColorBrush(Colors.Transparent),
                    BorderBrush = new SolidColorBrush(Colors.Transparent),
                };
                button1.Click += PageBtn_Click;
                NavSp.Children.Add(button1);

                for (int i = 1; i <= pageCount; i++)
                {
                    TextBlock textBlock = new TextBlock()
                    {
                        Text = i.ToString(),
                    };
                    if (i == pageNumber)
                    {
                        textBlock.TextDecorations = TextDecorations.Underline;
                    }
                    Button button2 = new Button
                    {
                        Content = textBlock,
                        IsHitTestVisible = i != pageNumber,
                        Background = new SolidColorBrush(Colors.Transparent),
                        BorderBrush = new SolidColorBrush(Colors.Transparent)
                    };
                    button2.Click += PageBtn_Click;
                    NavSp.Children.Add(button2);
                }

                Button button3 = new Button
                {
                    Content = ">",
                    IsHitTestVisible = pageNumber < pageCount,
                    Background = new SolidColorBrush(Colors.Transparent),
                    BorderBrush = new SolidColorBrush(Colors.Transparent)
                };
                button3.Click += PageBtn_Click;
                NavSp.Children.Add(button3);
            }

            LVServices.ItemsSource = serviceList;
        }

        private void PageBtn_Click(object sender, RoutedEventArgs e)
        {
            Button button = (Button)sender;
            switch (button.Content.ToString())
            {
                case "<":
                    pageNumber--;
                    break;
                case ">":
                    pageNumber++;
                    break;
                default:
                    pageNumber = int.Parse(((TextBlock)button.Content).Text);
                    break;
            }
            Refresh();
        }
        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            int prevPage = pageNumber; // Запоминаем текущую страницу
            Refresh();

            // Если после обновления есть столько страниц, сколько было, возвращаемся на старую страницу
            if (prevPage <= pageCount)
                pageNumber = prevPage;
            else
                pageNumber = pageCount; // Если страниц стало меньше, переходим на последнюю возможную

            Refresh();
        }

        private void CollectionCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int prevPage = pageNumber; // Запоминаем текущую страницу
            Refresh();

            // Если после обновления есть столько страниц, сколько было, возвращаемся на старую страницу
            if (prevPage <= pageCount)
                pageNumber = prevPage;
            else
                pageNumber = pageCount; // Если страниц стало меньше, переходим на последнюю возможную

            Refresh();
        }

        private void ExitBT_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AuthorizationPage());
        }

        private void CustomBT_Click(object sender, RoutedEventArgs e)
        {

        }

        private void CosplayBT_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        private void AddServiceBT_Click(object sender, RoutedEventArgs e)
        {

        }

        private void LVServices_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
