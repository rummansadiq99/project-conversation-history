# Project Conversation History

## Overview

This project implements a conversation history feature for projects in Ruby on Rails. Users can leave comments, and project managers can change the project's status. All comments and status changes are listed in chronological order.

## Questions and Expected Answers

### 1. What are the possible statuses for a project?
**Answer:** The project can have statuses like:
- **Not Started**
- **In Progress**
- **On Hold**
- **Completed**

### 2. Who can leave comments and change the status?
**Answer:**
- Only **project members** can leave comments.
- Only **project managers** can change the status.

### 3. Should comments support rich text formatting or just plain text?
**Answer:** Plain text is sufficient for now, but rich text may be considered later.

### 4. Do we need timestamps for comments and status changes?
**Answer:** Yes, each comment and status change should include a timestamp.

### 5. Should we notify users when a comment is added or the status changes?
**Answer:** Notifications (email or in-app) would be useful but are not required for this task.

### 6. How should the conversation history be displayed?
**Answer:** The history should be displayed in **chronological order**, showing:
- Comments with timestamps and user details
- Status changes with timestamps, user details, and optional messages

### 7. Do we need an edit or delete feature for comments?
**Answer:**
- Users should **not** be able to edit comments.
- Users should be able to **delete their own comments**.

### 8. Should status changes have an optional message or just the new status?
**Answer:** Yes, project managers should be able to add an **optional message** when changing the status.

---

## Implementation Plan

### Models
- **Project**: Has a `status` attribute.
- **Comment**: Belongs to a project and a user, stores text.
- **StatusChange**: Tracks project status updates with an optional message.

### Features
- Users can leave comments.
- Project managers can change project status.
- All changes are recorded with timestamps.
- Only comment authors can delete their own comments.
- The history is displayed in chronological order.

### Future Enhancements
- Support for rich text in comments.
- Email or in-app notifications for updates.

---
