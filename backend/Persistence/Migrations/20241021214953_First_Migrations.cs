using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Persistence.Migrations
{
    /// <inheritdoc />
    public partial class First_Migrations : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Amenities",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "text", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Amenities", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PaymentInformations",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    Currency = table.Column<int>(type: "integer", nullable: false),
                    PaymentFrequency = table.Column<int>(type: "integer", nullable: false),
                    Cost = table.Column<double>(type: "double precision", nullable: false),
                    Negotiable = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PaymentInformations", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PropertyLocations",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    StreetName = table.Column<string>(type: "text", nullable: false),
                    HouseNumber = table.Column<string>(type: "text", nullable: false),
                    City = table.Column<string>(type: "text", nullable: false),
                    Country = table.Column<string>(type: "text", nullable: false),
                    ZipCode = table.Column<string>(type: "text", nullable: true),
                    Longitude = table.Column<double>(type: "double precision", nullable: false),
                    Latitude = table.Column<double>(type: "double precision", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PropertyLocations", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    Id = table.Column<string>(type: "text", nullable: false),
                    FirstName = table.Column<string>(type: "text", nullable: false),
                    LastName = table.Column<string>(type: "text", nullable: false),
                    Gender = table.Column<string>(type: "text", nullable: true),
                    DateOfBirth = table.Column<DateOnly>(type: "date", nullable: false),
                    ProfilePictureUrl = table.Column<string>(type: "text", nullable: true),
                    VerificationToken = table.Column<string>(type: "text", nullable: true),
                    PasswordResetToken = table.Column<string>(type: "text", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UserName = table.Column<string>(type: "text", nullable: true),
                    NormalizedUserName = table.Column<string>(type: "text", nullable: true),
                    Email = table.Column<string>(type: "text", nullable: true),
                    NormalizedEmail = table.Column<string>(type: "text", nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "boolean", nullable: false),
                    PasswordHash = table.Column<string>(type: "text", nullable: true),
                    SecurityStamp = table.Column<string>(type: "text", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "text", nullable: true),
                    PhoneNumber = table.Column<string>(type: "text", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "boolean", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "boolean", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "timestamp with time zone", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "boolean", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Properties",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    ListerId = table.Column<string>(type: "text", nullable: false),
                    PaymentInformationId = table.Column<Guid>(type: "uuid", nullable: false),
                    PropertyLocationId = table.Column<Guid>(type: "uuid", nullable: false),
                    Title = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    Description = table.Column<string>(type: "text", nullable: true),
                    PropertyType = table.Column<int>(type: "integer", nullable: false),
                    PublishStatus = table.Column<int>(type: "integer", nullable: false),
                    MarketStatus = table.Column<int>(type: "integer", nullable: false),
                    ListingType = table.Column<int>(type: "integer", nullable: false),
                    PropertySize = table.Column<double>(type: "double precision", nullable: true),
                    AvailableStartDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    AvailableEndDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Properties", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Properties_PaymentInformations_PaymentInformationId",
                        column: x => x.PaymentInformationId,
                        principalTable: "PaymentInformations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Properties_PropertyLocations_PropertyLocationId",
                        column: x => x.PropertyLocationId,
                        principalTable: "PropertyLocations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Properties_User_ListerId",
                        column: x => x.ListerId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CommercialProperties",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    PropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    TotalFloors = table.Column<int>(type: "integer", nullable: false),
                    ParkingSpace = table.Column<bool>(type: "boolean", nullable: false),
                    FloorNumber = table.Column<int>(type: "integer", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CommercialProperties", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CommercialProperties_Properties_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Properties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PropertyAmenities",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    PropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    AmenityId = table.Column<Guid>(type: "uuid", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PropertyAmenities", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PropertyAmenities_Amenities_AmenityId",
                        column: x => x.AmenityId,
                        principalTable: "Amenities",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PropertyAmenities_Properties_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Properties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PropertyPhotos",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    PropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    Url = table.Column<string>(type: "text", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PropertyPhotos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PropertyPhotos_Properties_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Properties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PropertyVideos",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    PropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    Url = table.Column<string>(type: "text", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PropertyVideos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PropertyVideos_Properties_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Properties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ResidentialProperties",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    PropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    FurnishedStatus = table.Column<bool>(type: "boolean", nullable: false),
                    NumberOfBedrooms = table.Column<int>(type: "integer", nullable: false),
                    NumberOfBathrooms = table.Column<int>(type: "integer", nullable: false),
                    NumberOfWashrooms = table.Column<int>(type: "integer", nullable: false),
                    NumberOfKitchens = table.Column<int>(type: "integer", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ResidentialProperties", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ResidentialProperties_Properties_PropertyId",
                        column: x => x.PropertyId,
                        principalTable: "Properties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "EventSpaces",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    CommercialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    MaximumCapacity = table.Column<int>(type: "integer", nullable: false),
                    CateringServiceAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    AudioVisualEquipmentsAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    SuitableEvents = table.Column<int[]>(type: "integer[]", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EventSpaces", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EventSpaces_CommercialProperties_CommercialPropertyId",
                        column: x => x.CommercialPropertyId,
                        principalTable: "CommercialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "OfficeSpaces",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    CommercialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    OfficeSpaceType = table.Column<int>(type: "integer", nullable: false),
                    MeetingRoomsAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    ReceptionAreaAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OfficeSpaces", x => x.Id);
                    table.ForeignKey(
                        name: "FK_OfficeSpaces_CommercialProperties_CommercialPropertyId",
                        column: x => x.CommercialPropertyId,
                        principalTable: "CommercialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Shops",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    CommercialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    DisplayWindowAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    StorageRoomSize = table.Column<double>(type: "double precision", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Shops", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Shops_CommercialProperties_CommercialPropertyId",
                        column: x => x.CommercialPropertyId,
                        principalTable: "CommercialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Warehouses",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    CommercialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    CeilingHeight = table.Column<double>(type: "double precision", nullable: false),
                    LoadingDockAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    OfficeSpaceAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    SuitableGoods = table.Column<int[]>(type: "integer[]", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Warehouses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Warehouses_CommercialProperties_CommercialPropertyId",
                        column: x => x.CommercialPropertyId,
                        principalTable: "CommercialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Apartments",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    ResidentialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    NumberOfFloorsInBuilding = table.Column<int>(type: "integer", nullable: false),
                    FloorNumberOfUnit = table.Column<int>(type: "integer", nullable: false),
                    LaundryFacilityAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    CleaningServiceAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    StudentFriendly = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Apartments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Apartments_ResidentialProperties_ResidentialPropertyId",
                        column: x => x.ResidentialPropertyId,
                        principalTable: "ResidentialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "GuestHouses",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    ResidentialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    StarRating = table.Column<int>(type: "integer", nullable: false),
                    RestaurantOnSite = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GuestHouses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_GuestHouses_ResidentialProperties_ResidentialPropertyId",
                        column: x => x.ResidentialPropertyId,
                        principalTable: "ResidentialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Hotels",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    ResidentialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    StarRating = table.Column<int>(type: "integer", nullable: false),
                    RestaurantOnSite = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Hotels", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Hotels_ResidentialProperties_ResidentialPropertyId",
                        column: x => x.ResidentialPropertyId,
                        principalTable: "ResidentialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Houses",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    ResidentialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    NumberOfStories = table.Column<int>(type: "integer", nullable: false),
                    GarageSpace = table.Column<double>(type: "double precision", nullable: false),
                    StudentFriendly = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Houses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Houses_ResidentialProperties_ResidentialPropertyId",
                        column: x => x.ResidentialPropertyId,
                        principalTable: "ResidentialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StudentHostels",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    ResidentialPropertyId = table.Column<Guid>(type: "uuid", nullable: false),
                    RoomTypes = table.Column<int[]>(type: "integer[]", nullable: false),
                    HostelType = table.Column<int>(type: "integer", nullable: false),
                    HostelLocation = table.Column<int>(type: "integer", nullable: false),
                    SharedFacilities = table.Column<bool>(type: "boolean", nullable: false),
                    MealPlanAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    StudyAreaAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    LaundryFacilityAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    CleaningServiceAvailable = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentHostels", x => x.Id);
                    table.ForeignKey(
                        name: "FK_StudentHostels_ResidentialProperties_ResidentialPropertyId",
                        column: x => x.ResidentialPropertyId,
                        principalTable: "ResidentialProperties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Apartments_ResidentialPropertyId",
                table: "Apartments",
                column: "ResidentialPropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_CommercialProperties_PropertyId",
                table: "CommercialProperties",
                column: "PropertyId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_EventSpaces_CommercialPropertyId",
                table: "EventSpaces",
                column: "CommercialPropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_GuestHouses_ResidentialPropertyId",
                table: "GuestHouses",
                column: "ResidentialPropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_Hotels_ResidentialPropertyId",
                table: "Hotels",
                column: "ResidentialPropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_Houses_ResidentialPropertyId",
                table: "Houses",
                column: "ResidentialPropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_OfficeSpaces_CommercialPropertyId",
                table: "OfficeSpaces",
                column: "CommercialPropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_Properties_ListerId",
                table: "Properties",
                column: "ListerId");

            migrationBuilder.CreateIndex(
                name: "IX_Properties_PaymentInformationId",
                table: "Properties",
                column: "PaymentInformationId");

            migrationBuilder.CreateIndex(
                name: "IX_Properties_PropertyLocationId",
                table: "Properties",
                column: "PropertyLocationId");

            migrationBuilder.CreateIndex(
                name: "IX_PropertyAmenities_AmenityId",
                table: "PropertyAmenities",
                column: "AmenityId");

            migrationBuilder.CreateIndex(
                name: "IX_PropertyAmenities_PropertyId",
                table: "PropertyAmenities",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_PropertyPhotos_PropertyId",
                table: "PropertyPhotos",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_PropertyVideos_PropertyId",
                table: "PropertyVideos",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_ResidentialProperties_PropertyId",
                table: "ResidentialProperties",
                column: "PropertyId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Shops_CommercialPropertyId",
                table: "Shops",
                column: "CommercialPropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentHostels_ResidentialPropertyId",
                table: "StudentHostels",
                column: "ResidentialPropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_Warehouses_CommercialPropertyId",
                table: "Warehouses",
                column: "CommercialPropertyId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Apartments");

            migrationBuilder.DropTable(
                name: "EventSpaces");

            migrationBuilder.DropTable(
                name: "GuestHouses");

            migrationBuilder.DropTable(
                name: "Hotels");

            migrationBuilder.DropTable(
                name: "Houses");

            migrationBuilder.DropTable(
                name: "OfficeSpaces");

            migrationBuilder.DropTable(
                name: "PropertyAmenities");

            migrationBuilder.DropTable(
                name: "PropertyPhotos");

            migrationBuilder.DropTable(
                name: "PropertyVideos");

            migrationBuilder.DropTable(
                name: "Shops");

            migrationBuilder.DropTable(
                name: "StudentHostels");

            migrationBuilder.DropTable(
                name: "Warehouses");

            migrationBuilder.DropTable(
                name: "Amenities");

            migrationBuilder.DropTable(
                name: "ResidentialProperties");

            migrationBuilder.DropTable(
                name: "CommercialProperties");

            migrationBuilder.DropTable(
                name: "Properties");

            migrationBuilder.DropTable(
                name: "PaymentInformations");

            migrationBuilder.DropTable(
                name: "PropertyLocations");

            migrationBuilder.DropTable(
                name: "User");
        }
    }
}
