using Microsoft.Extensions.Configuration;
using Application.Contracts;
using System.Net.Mail;
using System.Net;

namespace Infrastructure.EmailService
{
    public class EmailService : IEmailService
    {
        private readonly IConfiguration _configuration;

        public EmailService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task SendEmailAsync(string to, string subject, string body)
        {
            var emailSettings = _configuration.GetSection("EmailSettings");

            var smtpClient = new SmtpClient
            {
                Host = emailSettings["SmtpServer"],
                Port = int.Parse(emailSettings["SmtpPort"]),
                EnableSsl = true,
                Credentials = new NetworkCredential(emailSettings["SmtpUsername"], emailSettings["SmtpPassword"])
            };

            var mailMessage = new MailMessage
            {
                From = new MailAddress(emailSettings["SenderEmail"]),
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            };


            mailMessage.To.Add(to);

            try{
                await smtpClient.SendMailAsync(mailMessage);
            }
            catch(Exception ex){
                throw new InvalidOperationException($"Error sending email: {ex.Message}");
            }
        }
    }
}