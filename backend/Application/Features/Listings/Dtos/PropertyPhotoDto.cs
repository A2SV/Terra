namespace Application.Features.Listings.Dtos
{
    public class PropertyPhotoDto
    {
        public Guid Id { get; set; }
        public required string Url { get; set; }
    }
}