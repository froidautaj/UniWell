# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ======= Categories ===========

categories = ['Psychological', 'Nutrition', 'Exercise', 'Social Support', 'Academic Well-Being', 'Stress Management']
categories.each do |category|
  Category.find_or_create_by!(name: category)
end

# ======= Categories ===========

# ======= Users ===========

# User.destroy_all

super_user = SuperUser.new(
  first_name: 'Super',
  last_name: 'User',
  email: 'superuser@test.com',
  password: '123456',
  password_confirmation: '123456'
)
super_user.skip_confirmation!
super_user.save!

users = [
  {
    first_name: 'John',
    last_name: 'Smith',
    email: 'johnsmith@test.com',
    password: '123456',
    password_confirmation: '123456'
  },
  {
    first_name: 'James',
    last_name: 'Baker',
    email: 'jamesbaker@test.com',
    password: '123456',
    password_confirmation: '123456'
  },
  {
    first_name: 'Charlotte',
    last_name: 'King',
    email: 'charlottekind@test.com',
    password: '123456',
    password_confirmation: '123456'
  },
  {
    first_name: 'Emily',
    last_name: 'Knight',
    email: 'emilyknight@test.com',
    password: '123456',
    password_confirmation: '123456'
  },
  {
    first_name: 'Oliver',
    last_name: 'Hughes',
    email: 'oliverhughes@test.com',
    password: '123456',
    password_confirmation: '123456'
  },
  {
    first_name: 'Alex',
    last_name: 'Wells',
    email: 'alexwells@test.com',
    password: '123456',
    password_confirmation: '123456'
  }
]

users.each do |user|
  new_user = User.new(user)
  new_user.skip_confirmation!
  new_user.save!
end

# ======= Users ===========


# ======= Posts ===========
data = [
  {
    post: {
      title: 'How Does Emotional Intelligence Impact Our Daily Lives?',
      content: "Hi everyone,
      I've been reading a lot about emotional intelligence (EI) lately and its significance in various
      aspects of life. Emotional intelligence refers to the ability to recognize, understand, manage,
      and influence our own emotions and the emotions of others.
      I'm curious to know your thoughts and experiences regarding EI. How do you think
      emotional intelligence impacts our daily lives, both personally and professionally? Have you
      noticed any changes in your relationships or work environment by applying principles of
      emotional intelligence?
      Additionally, do you have any tips or practices that have helped you enhance your emotional
      intelligence? Looking forward to hearing your insights and experiences!",
      category: Category.find_by(name: 'Psychological'),
      user: User.find_by(email: 'johnsmith@test.com'),
      tags: ' emotional intelligence,relationships,work environment'
    },
    comments: [
      {
        user: User.find_by(email: 'jamesbaker@test.com'),
        content: "I think emotional intelligence is crucial, especially in the workplace. I've noticed that colleagues with high EI tend to handle stress better and have more positive interactions with others. They seem to resolve conflicts more effectively and create a more collaborative environment. Personally, I've been trying to improve my EI by practising mindfulness and active listening, which has helped me stay calm in tense situations."
      },
      {
        user: User.find_by(email: 'charlottekind@test.com'),
        content: "Great question! Emotional intelligence has a huge impact on our personal lives too. For instance, being able to understand and manage our emotions can lead to better relationships. I found an interesting article by Daniel Goleman, who is a pioneer in EI research, where he talks about how empathy, a key component of EI, can enhance our interpersonal relationships. If you're interested, here's the link: https://www.danielgoleman.info/books/what-makes-a-leader-why-emotional-intelligence-mat ters/"
      },
      {
        user: User.find_by(email: 'emilyknight@test.com'),
        content: "From my experience, emotional intelligence is essential for personal growth. It helps in self-awareness and self-regulation. I read a study that suggested people with high EI are more likely to succeed in their careers because they can navigate social complexities and lead more effectively. The study is from the Harvard Business Review, and it really changed my perspective on how we can develop these skills over time. Here’s the article: https://hbr.org/1998/11/what-makes-a-leader"
      }
    ]
  },
  {
    post: {
      title: 'How Do You Maintain Academic Well-Being During Stressful Times?',
      content: "Hi everyone,
                As students, we often face periods of intense academic pressure, whether it's during exam seasons, project deadlines, or balancing multiple courses. I'm interested in knowing how you all maintain your academic well-being during these stressful times.
                What strategies or practices do you use to stay mentally and physically healthy while managing your academic workload? Do you have any tips on time management, stress reduction, or maintaining a balanced lifestyle that have worked for you?

                Additionally, if there are any resources or articles that you've found helpful, please share them! Let's support each other in achieving both academic success and well-being.
                Looking forward to your insights!",
      category: Category.find_by(name: 'Academic Well-Being'),
      user: User.find_by(email: 'charlottekind@test.com'),
      tags: ' academic pressure,stress reduction,time management'
    },
    comments: [
      {
        user: User.find_by(email: 'oliverhughes@test.com'),
        content: "I can totally relate to the stress during exam seasons. One thing that has really helped me is practicing mindfulness meditation. Just taking 10-15 minutes a day to clear my mind and focus on my breathing has made a big difference in reducing my stress levels. There are some great apps like Headspace and Calm that offer guided meditations. Also, making sure to take regular breaks during study sessions to avoid burnout is key."
      },
      {
        user: User.find_by(email: 'charlottekind@test.com'),
        content: "Great topic! I find that keeping a structured schedule helps a lot. I use a planner to break down my tasks into manageable chunks and set specific goals for each study session. This helps me stay organised and prevents me from feeling overwhelmed. I also make sure to incorporate physical activity into my routine, like a quick workout or a walk, which boosts my energy and mood. Here's an article I found helpful on time management for students: https://www.topuniversities.com/student-info/careers-advice/how-get-better-time-managemen t-problem-solving"
      },
      {
        user: User.find_by(email: 'alexwells@test.com'),
        content: "I've been through some stressful academic periods, and what really helped me was reaching out for support. Whether it's talking to friends, family, or even a counsellor, having someone to share your feelings with can lighten the load. Universities often have mental health resources and counselling services, so don't hesitate to use them. I also recommend looking into study groups; they can provide both academic support and a sense of community. Here's a useful resource on student mental health: https://www.studentminds.org.uk/"
      }
    ]
  },
  {
    post: {
      title: 'What Are Your Best Strategies for Managing Stress?',
      content: "Hi everyone,
                We all know how overwhelming life can get with various responsibilities and unexpected challenges. Stress is something that affects all of us at some point, and managing it effectively is crucial for maintaining both mental and physical health.
                I'm interested in hearing about the strategies you use to manage stress. Whether it's techniques you practise regularly or specific tips that have helped you during particularly stressful times, please share!
                Here are a few methods I've come across:
                ● Exercise: Regular physical activity can significantly reduce stress levels and improve mood.
                ● Mindfulness and Meditation: Practices like deep breathing, meditation, and yoga can help calm the mind.
                ● Time Management: Planning and organising your tasks can prevent feeling overwhelmed.
                ● Healthy Diet: Eating nutritious food can improve your overall well-being and resilience to stress.
                ● Social Support: Talking to friends and family or seeking professional help when needed.
                What works best for you? Do you have any resources, articles, or personal experiences to share that others might find helpful?",
      category: Category.find_by(name: 'Stress Management'),
      user: User.find_by(email: 'alexwells@test.com'),
      tags: ' stress,mental health,well-being'
    },
    comments: [
      {
        user: User.find_by(email: 'jamesbaker@test.com'),
        content: "For me, exercise is the best stress reliever. I try to incorporate a mix of cardio and strength training into my routine. It not only helps me stay physically fit but also boosts my mood and energy levels. There's plenty of research supporting the benefits of exercise for stress management. I recently read an article on Healthline that explained how exercise increases endorphins, which are natural stress fighters. Here’s the link: https://www.healthline.com/nutrition/16-ways-relieve-stress-anxiety"
      },
      {
        user: User.find_by(email: 'emilyknight@test.com'),
        content: "I’ve found that mindfulness meditation works wonders for managing my stress. I use an app called Headspace, which offers guided meditations and mindfulness exercises. It helps me stay focused and calm, especially during hectic days. According to a study published in the Journal of Clinical Psychology, mindfulness can significantly reduce symptoms of anxiety and stress. If you're new to it, I recommend starting with just 5-10 minutes a day. Here’s a link: https://www.headspace.com/"
      },
      {
        user: User.find_by(email: 'alexwells@test.com'),
        content: "Time management has been a game-changer for me. I use a planner to organise my tasks and set priorities. This prevents me from feeling overwhelmed by my workload. I also follow the Pomodoro Technique, which involves working for 25 minutes and then taking a 5-minute break. It keeps me productive and reduces stress. Here’s a useful article about the Pomodoro Technique if anyone is interested: https://www.pomodorotechnique.com/"
      },
      {
        user: User.find_by(email: 'oliverhughes@test.com'),
        content: "Social support is incredibly important. Whenever I feel stressed, I make sure to talk to my friends or family. Sometimes just having someone listen can make a huge difference. Universities often offer counselling services, which can be really helpful if you’re feeling overwhelmed. I also recommend joining clubs or groups that interest you, as having a support
            network is vital for managing stress. Here’s a helpful resource on student mental health support: https://www.studentminds.org.uk/"
      }
    ]
  },
  {
    post: {
      title: 'How Do You Incorporate Exercise Into Your University Routine?',
      content: "Hi everyone,
                Balancing academics, social life, and personal time can be quite challenging for university students. However, one essential aspect that often gets overlooked is regular exercise. Staying active is crucial not only for physical health but also for mental well-being, improved concentration, and better academic performance.
                I'm curious to know how you all incorporate exercise into your busy university schedules. Do you have any tips, routines, or favorite activities that help you stay active? Here are a few ideas to get the conversation started:
                ● Short Workouts: Quick 15-20 minute workouts that can be done in your room or at the gym.
                ● Campus Facilities: Making use of university gyms, swimming pools, or sports facilities.
                ● Group Activities: Joining sports teams, fitness classes, or running clubs.
                ● Active Commuting: Walking or biking to classes instead of driving or taking the bus.
                ● Break Time: Taking short breaks between study sessions to stretch or go for a walk.
                I’ve found that even a small amount of regular exercise can make a big difference in how I feel and perform academically. What about you? Share your experiences, tips, and any resources that others might find helpful!
                Looking forward to hearing your thoughts!",
      category: Category.find_by(name: 'Exercise'),
      user: User.find_by(email: 'emilyknight@test.com'),
      tags: ' exercise,physical health,mental well-being'
    },
    comments: [
      {
        user: User.find_by(email: 'alexwells@test.com'),
        content: "I totally agree that exercise is essential. I usually squeeze in a 20-minute workout in my dorm room every morning using YouTube videos. There are tons of quick, high-intensity interval training (HIIT) workouts that don’t require any equipment and can be done in a small space. It really energises me for the day ahead."
      },
      {
        user: User.find_by(email: 'johnsmith@test.com'),
        content: "I love making use of the campus gym. They offer a variety of fitness classes like yoga, spin, and pilates, which I find really motivating because they’re scheduled at specific times, so it forces me to make time for them. Plus, working out with others can be a great way to stay motivated."
      }
    ]
  },
  {
    post: {
      title: 'How Do You Maintain a Healthy Diet While at University?',
      content: "Hi everyone,
                Balancing a healthy diet with the demands of university life can be quite a challenge. With tight schedules, limited budgets, and sometimes limited kitchen facilities, it's easy to fall into the trap of unhealthy eating habits. However, good nutrition is crucial for maintaining energy levels, enhancing academic performance, and overall well-being.
                I’m curious to know how you all manage to maintain a healthy diet while at university. What are some of your go-to meals, snacks, and tips for eating well on a budget? Here are a few ideas to get the conversation started:
                ● Meal Prep: Preparing meals in advance to avoid the temptation of fast food.
                ● Healthy Snacks: Keeping fruits, nuts, and yoghourt on hand for quick, nutritious
                snacks.
                ● Balanced Meals: Ensuring each meal includes a good mix of protein, healthy fats, and vegetables.
                ● Budget-Friendly Shopping: Finding affordable ways to eat healthy, like buying in bulk or choosing seasonal produce.
                ● Cooking Tips: Simple, quick recipes that can be made with minimal equipment and ingredients.
                Personally, I’ve found that planning my meals for the week and cooking in batches has helped me stay on track. What about you? Share your tips, favourite recipes, and any resources that others might find helpful!",
      user: User.find_by(email: 'jamesbaker@test.com'),
      category: Category.find_by(name: 'Nutrition'),
      tags: ' healthy diet,meal prep,budget-friendly'
    },
    comments: [
      {
        user: User.find_by(email: 'emilyknight@test.com'),
        content: "Maintaining a healthy diet at university can be tough, but it's definitely doable with some planning and smart choices. Here are a few strategies that have worked for me:
                  1. Meal Prep: I dedicate a few hours every Sunday to meal prep. This involves cooking large batches of food that can be easily portioned out for the week. Some of my go-to recipes are quinoa salads, stir-fries, and roasted vegetables with chicken or tofu. I store these in reusable containers, so I always have a healthy meal ready to go. According to a study published in the American Journal of Preventive Medicine, meal prepping is associated with better diet quality and adherence to dietary guidelines.
                  2. Healthy Snacks: Keeping healthy snacks on hand is crucial. I stock up on fruits like apples and bananas, which are easy to grab on the go. Nuts and seeds are also great for quick snacks, as they provide a good source of protein and healthy fats. Research from the Journal of Nutrition suggests that nuts can help improve overall diet quality and provide essential nutrients.
                  For more tips on meal prepping, check out this guide from the Academy of Nutrition and Dietetics: https://www.eatright.org/food/food-preparation/cooking-tips/basics-of-meal-prepping"
      },
      {
        user: User.find_by(email: 'jamesbaker@test.com'),
        content: "Eating well on a budget is definitely possible with a bit of planning and creativity. Here are a few tips that have helped me:
                  1. Budget-Friendly Shopping: I focus on buying seasonal produce, which is often cheaper and fresher. Farmers' markets can be a great place to find affordable fruits and vegetables. I also buy staples like rice, beans, and oats in bulk, which saves money in the long run. A study from Public Health Nutrition found that shopping at farmers' markets and buying in bulk can significantly reduce grocery costs while improving diet quality.
                  2. Balanced Meals: I aim to include a variety of food groups in each meal. For breakfast, I might have oatmeal topped with fruit and nuts. Lunch could be a whole grain wrap with hummus, veggies, and lean protein like grilled chicken. For dinner, I often make a stir-fry with lots of colorful vegetables, a protein source, and brown rice or quinoa. Eating a balanced diet ensures I get the nutrients I need to stay energized and focused throughout the day. The Dietary Guidelines for Americans recommend a balanced plate with half vegetables and fruits, a quarter whole grains, and a quarter protein.
                  For more budget-friendly eating tips, this article from Harvard Health offers some excellent advice: https://www.health.harvard.edu/staying-healthy/healthy-eating-on-a-budget"
      }
    ]
  },
  {
    post: {
      title: 'How Do You Find and Maintain Social Support While at University?',
      content: "Hi everyone,
              Navigating university life can be incredibly challenging, and having a strong support system can make a huge difference. Social support from friends, family, and peers not only helps in managing stress but also enhances overall well-being and academic performance.
              I’m interested in hearing how you all find and maintain social support during your time at university. Here are a few questions to get the discussion started:
              ● Making Friends: How do you go about making new friends on campus?
              ● Keeping in Touch: What are your strategies for staying connected with family and old
              friends while balancing a busy university schedule?
              ● Peer Support: Do you participate in study groups, clubs, or other social activities that
              help you feel supported?
              ● Seeking Help: How do you approach seeking help when you need it, whether it's
              academic or personal?
              Personally, joining clubs and attending campus events has helped me build a network of friends who understand the ups and downs of university life. I also make it a point to call my family regularly to stay connected.
              Looking forward to your insights and experiences!",
      user: User.find_by(email: 'jamesbaker@test.com'),
      category: Category.find_by(name: 'Social Support'),
      tags: ' social support,friends,family'
    },
    comments: [
      {
        user: User.find_by(email: 'oliverhughes@test.com'),
        content: "Joining study groups has been a lifesaver for me. Not only do they provide academic support, but they also offer a sense of camaraderie. It’s comforting to know that others are going through the same challenges. Plus, explaining concepts to others can reinforce your own understanding."
      },
      {
        user: User.find_by(email: 'johnsmith@test.com'),
        content: "Keeping in touch with family and old friends while at university is essential for maintaining a strong support network. I use video calls to stay connected with my family back home. Scheduling regular calls helps me feel grounded and supported. Research published in the Journal of Adolescence highlights that maintaining close relationships with family members can reduce feelings of loneliness and increase emotional well-being. For more on this, check out this article: https://www.sciencedirect.com/science/article/pii/S0140197118301745"
      },
      {
        user: User.find_by(email: 'alexwells@test.com'),
        content: "When I need help, I don’t hesitate to reach out to university counselling services. They offer professional support and can guide you through tough times. Universities also often have peer support programs, where you can talk to trained fellow students. Remember, seeking help is a sign of strength, not weakness."
      },
      {
        user: User.find_by(email: 'charlottekind@test.com'),
        content: "I’ve found that attending campus events is a great way to meet new people and build a support system. Whether it's cultural events, sports matches, or workshops, these events are designed to bring students together. Don’t be afraid to step out of your comfort zone and attend something new."
      },
      {
        user: User.find_by(email: 'emilyknight@test.com'),
        content: "Making friends on campus can be daunting, but joining clubs and societies really helps. I joined the drama club and met people with similar interests. It’s also a great way to de-stress. According to a study from the Journal of College Student Development, involvement in campus organisations is linked to higher levels of social support and better mental health. Additionally, participating in these activities can help build a sense of community and belonging, which is crucial during the university years. Here's the study if you're interested in reading more: https://muse.jhu.edu/article/781691"
      }
    ]
  }
]

data.each do |post_data|
  post_attributes = post_data[:post]
  post_attributes[:tags] = post_attributes[:tags].split(',')

  post = Post.new(post_attributes)
  post.save(validate: false)
  post_data[:comments].each do |comment_data|
    comment = post.comments.new(comment_data)
    comment.save(validate: false)
    post.increment!(:total_comments)
  end
end


# ======= Posts ===========
