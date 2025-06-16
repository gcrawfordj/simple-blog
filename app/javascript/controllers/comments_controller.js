import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggleReplyForm(event) {
    const commentId = event.currentTarget.dataset.commentId
    const replyForm = document.getElementById(`reply-form-${commentId}`)
    replyForm.style.display = replyForm.style.display === 'none' ? 'block' : 'none'
  }
} 