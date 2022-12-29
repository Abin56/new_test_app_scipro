
class Video{
  final String name;
  final String  url;
  final String thumbnail;

  const Video({
    required this.name,
    required this.url,
    required this.thumbnail
});
}

const videos = [
  Video(
      name: 'video1',
      url: 'https://firebasestorage.googleapis.com/v0/b/lepton-scipro-91560.appspot.com/o/pb9ODNj4jyX8mGEtnGr26E6HxD72%2FBlood%20and%20phlebotomy%20last%20class.mp4?alt=media&token=9b250280-cdbd-4282-9d7e-2e3255084996',
      thumbnail: 'https://firebasestorage.googleapis.com/v0/b/lepton-scipro-91560.appspot.com/o/pb9ODNj4jyX8mGEtnGr26E6HxD72%2Felec.jpg?alt=media&token=8756aec7-a8bd-4612-aae5-807f6a0c2f18'),
  Video(name: 'video2',
      url: 'https://firebasestorage.googleapis.com/v0/b/lepton-scipro-91560.appspot.com/o/pb9ODNj4jyX8mGEtnGr26E6HxD72%2Fvidma_recorder_10092022_131810.mp4?alt=media&token=e672507f-bd13-437c-aa0d-7e2de054bc79',
      thumbnail: 'https://firebasestorage.googleapis.com/v0/b/lepton-scipro-91560.appspot.com/o/pb9ODNj4jyX8mGEtnGr26E6HxD72%2Fforshoot2.png?alt=media&token=46351bc2-18b6-4505-aeed-0b3a3e84ed9e'),
];