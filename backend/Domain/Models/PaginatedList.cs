using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class PaginatedList<T>
    {
        public List<T> Items { get; }
        public int PageIndex { get; }
        public int TotalPages { get; }
        public bool HasPreviousPage => PageIndex > 1;
        public  bool HasNextPage => PageIndex < TotalPages;

        public PaginatedList(List<T> items, int pageIndex, int totalPages)
        {
            Items = items;
            PageIndex = pageIndex;
            TotalPages = totalPages;
        }
    }
}
