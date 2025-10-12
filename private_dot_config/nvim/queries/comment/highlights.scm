; extends

("text" @comment.warning @nospell
  (#any-of? @comment.warning "@dev" "@notice" "@param" "@return" "@author" "@see" "@inheritdoc" "@title" "@custom"))
