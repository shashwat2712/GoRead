# GoRead

GoRead is an innovative news application designed to provide users with concise and up-to-date news summaries. Leveraging advanced web scraping and summarization technologies, GoRead offers a seamless and efficient news reading experience with mindful scrolling and real-time updates.

## Features

- **News Summarization**: Provides concise summaries of news articles using advanced text summarization models.
- **Mindful Scrolling**: Allows users to scroll through news reels with a focus on minimizing distractions.
- **Top Headlines**: Displays the latest top headlines in the home feed.
- **Save Articles**: Users can save and manage their favorite news articles.
- **Summarization Feature**: Submit the URL of any article or news report for summarization. Includes a chat box for interactive queries based on article content.
- **Redis Caching**: Utilizes Redis for fast and efficient retrieval of news data.
- **Real-Time Updates**: News data is updated every 5 minutes to ensure the latest content is available.
- **Interactive Chatbot** which will answer all your query.

## Technologies Used

- **Frontend**: Flutter
- **Backend**: FastAPI
- **AI Model**: Pegasus model fine-tuned on a newspaper dataset
- **Caching**: Redis

## Installation

### Prerequisites

- Flutter SDK
- Python 3.8+
- FastAPI
- Redis

### Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/goread.git
   cd goread
   ```

2. **Configuration:**

   - Create a `.env` file in the `backend` directory and add your Redis connection parameters and other environment variables.
   - Ensure Redis is running and accessible.

3. **Run the Application:**

   - Start the FastAPI server:

     ```bash
     uvicorn main:app --reload
     ```

   - Run the Flutter app:

     ```bash
     flutter run
     ```

## Usage

1. **Explore News**: Browse through the latest headlines and summaries.
2. **Summarize Articles**: Enter the URL of an article to receive a summarized version.
3. **Save Articles**: Save and access your favorite news articles for later reading.
4. **Interactive Summarization**: Use the chat box to ask questions and get summaries based on article content.

## Scheduled Updates

- News data is automatically updated every 5 minutes using a scheduled task.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or inquiries, please contact:

- **Email**: shashwatsaivyas.com
- **GitHub**: [shashwat2712](https://github.com/shashwat2712)

---

Feel free to adjust and expand upon this template as needed for your project.
