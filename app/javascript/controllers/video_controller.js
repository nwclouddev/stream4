import { Controller } from "@hotwired/stimulus"
import videojs from 'video.js'
// import 'video.js/dist/video-js.css'

export default class extends Controller {
  static targets = ['player']
  connect() {}
  initialize() {
    let videoPlayer = videojs(this.playerTarget, {
      controls: true,
      playbackRates: [0.5, 1, 2],
      autoplay: false,
      fluid: true
    })
    videoPlayer.addClass('video-js')
    videoPlayer.addClass('vjs-big-play-centered')
    videoPlayer.addClass('object-fit-contain')
  }
  disconnect() {}
}