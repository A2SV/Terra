import { NextResponse } from "next/server";
import nodemailer from "nodemailer";

export async function POST(req: Request) {
    try {
        const { name, email, phone, subject, message } = await req.json();

        const port = Number(process.env.EMAIL_PORT) || 587;
        const transporter = nodemailer.createTransport({
            host: process.env.EMAIL_HOST,
            port,
            secure: port === 465,
            auth: {
                user: process.env.EMAIL_USER,
                pass: process.env.EMAIL_PASS,
            },
            tls: {
                rejectUnauthorized: false,
            },
        });

        const mailOptions = {
            from: `"Contact Form" <${process.env.EMAIL_USER}>`,
            to: process.env.CONTACT_RECEIVER,
            subject: subject || "New Contact Form Message",
            text: `Name: ${name}\nEmail: ${email}\nPhone: ${phone}\n\nMessage:\n${message}`,
        };

        const info = await transporter.sendMail(mailOptions);
        return NextResponse.json({ success: true, info });
    } catch (error: any) {
        console.error("Email sending error:", error);
        return NextResponse.json({ success: false, error: error.message }, { status: 500 });
    }
}