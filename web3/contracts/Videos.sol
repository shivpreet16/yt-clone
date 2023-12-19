// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MyContract {
    struct Video {
        address author;
        string title;
        string description;
        string[] tags;
        string videoHash;
        string thumbnailHash;
    }
    mapping(uint => Video) public videos;
    uint public videoCount = 0;

    function uploadVideo(address _author, string memory _title, string memory _description, string[] memory _tags, string memory _videoHash, string memory _thumbnail) public returns (uint) {
        videoCount++;
        videos[videoCount] = Video(_author, _title, _description, _tags, _videoHash, _thumbnail);
        return videoCount;
    }

    function getVideo(address _author) public view returns (Video[] memory){
        Video[] memory _videos = new Video[](videoCount);
        for(uint i = 0; i < videoCount; i++) {
            if(videos[i].author == _author) {
                _videos[i] = videos[i];
            }
        }
        return _videos;
    }

    function getVideo(uint _id) public view returns (Video memory) {
        return videos[_id];
    }

    function deleteVideo(uint _id) public {
        delete videos[_id];
    }
}