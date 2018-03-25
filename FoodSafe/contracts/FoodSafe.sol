pragma solidity ^0.4.17;

contract FoodSafe
{
    struct Location {
        string Name;
        uint LocationId;
        uint PreviousLocationId;
        uint Timestamp;
        string Secret;
    }

    mapping(uint => Location) Trail;
    uint8 TrailCount = 0;

    function AddNewLocation(uint locationId, string name, string secret) public {
        Location memory newLocation;
        newLocation.Name = name;
        newLocation.LocationId = locationId;
        newLocation.Secret = secret;
        newLocation.Timestamp = block.timestamp;

        if (TrailCount > 0) {
            newLocation.PreviousLocationId = Trail[TrailCount].LocationId;
        }

        Trail[TrailCount] = newLocation;
        TrailCount++;
    }

    function GetTrailCount() public view returns (uint8) {
        return TrailCount;
    }

    function GetLocation(uint8 trailNo) public view returns (string, uint, uint, uint, string) {
        return (
            Trail[trailNo].Name,
            Trail[trailNo].LocationId,
            Trail[trailNo].PreviousLocationId,
            Trail[trailNo].Timestamp,
            Trail[trailNo].Secret
        );
    }
}
