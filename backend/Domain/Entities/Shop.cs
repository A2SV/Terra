using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class Shop : BaseEntity
    {
        public bool DisplayWindowAvailable { get; set; }
        public double StorageRoomSize { get; set; }
    }
}