import { NextApiRequest, NextApiResponse } from "next";
import axios from "axios";

const GOOGLE_API_KEY = process.env.NEXT_PUBLIC_GOOGLE_MAP_API_KEY;

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const { placeId } = req.query;

  if (!placeId) {
    return res.status(400).json({ error: "Place ID is required" });
  }

  try {
    const response = await axios.get(
      `https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeId}&key=${GOOGLE_API_KEY}&fields=geometry,name`
    );
    res.status(200).json(response.data);
  } catch (error) {
    res.status(500).json({ error: (error as any).message });
  }
}
