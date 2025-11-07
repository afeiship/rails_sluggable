# 清空数据
Post.delete_all

# 创建示例文章
Post.create!([
  {
    title: "Rails 入门指南",
    content: "Ruby on Rails 是一个强大的 Web 开发框架...",
  },
  {
    title: "PostgreSQL 数据库使用",
    content: "PostgreSQL 是一个功能强大的开源数据库...",
  }
])

puts "创建了 #{Post.count} 篇文章"