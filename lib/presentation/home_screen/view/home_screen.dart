import 'package:elegenza/presentation/cart_screen/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/app_drawer.dart';
import '../../../widgets/responsive_layout.dart';
import '../../../core/model/product_model.dart';
import '../../cart_screen/controller/cart_controller.dart';
import '../../cart_screen/widgets/cart_badge.dart';
import '../../product_details_screen/view/product_details_screen.dart';
import '../widget/product-card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Western ladies dresses
    final List<Product> products = [
      Product(
        id: '1',
        name: 'Floral Summer Dress',
        description: 'Lightweight floral print dress with puff sleeves',
        price: 49.99,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsNS0prsf_a8W7IVvjKODzv6J58cH6Wj7heQ&s',
      ),
      Product(
        id: '2',
        name: 'Denim Jacket Dress',
        description: 'Stylish denim dress with front pockets',
        price: 59.99,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrWFKZLRhn41byJTXPDRvVhUwLPIde4rRdJw&s',
      ),
      Product(
        id: '3',
        name: 'Elegant Evening Gown',
        description: 'Long sleeve bodycon dress for special occasions',
        price: 89.99,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQquy7MuzxHg7ywuRKNHYi8ZzPp_SxiaNK9jA&s',
      ),
      Product(
        id: '4',
        name: 'Casual T-Shirt Dress',
        description: 'Comfy oversized t-shirt dress for everyday wear',
        price: 29.99,
        imageUrl: 'data:image/jpeg;base64,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',
      ),
      Product(
        id: '5',
        name: 'Wrap Midi Dress',
        description: 'Flattering wrap dress with v-neckline',
        price: 45.99,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xUtMjIrsAhWvN3lBlVdlV80rPnV05XuLHw&s',
      ),
      Product(
        id: '6',
        name: 'Polka Dot Sundress',
        description: 'Short sleeve sundress with elastic waist',
        price: 39.99,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsNS0prsf_a8W7IVvjKODzv6J58cH6Wj7heQ&s',
      ),
      Product(
        id: '7',
        name: 'Velvet Party Dress',
        description: 'Sleeveless velvet dress with slit',
        price: 65.99,
        imageUrl: 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUSExMVFRUXFxcXFxYXFxYYFRgXGBUXGhgYFxcYHSggGholHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQGy0lHSUtLS0tLS0tLS0tKy0tLS0rKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIARMAtwMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAEAQIDBQYAB//EADwQAAEDAgMECQIFBAIBBQAAAAEAAhEDIQQSMQVBUWEGEyIycYGRobHB8BRCUtHhI2Jy8RUWogdjgrLC/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAECAwQFBv/EACsRAAICAgICAAUCBwAAAAAAAAABAhEDEiExBEETMlFhgSJxI0JDocHR8f/aAAwDAQACEQMRAD8AcGJwYnhqWFBoR5EuRSQlhAEWRd1amyrsqABn4cHUIWvsik/vNBVmAuLUABNwTQIAgIapsemdRKtcqSEAVP8Aw1Lgh6/Ryi65CvSE1wQBma3RahwKrsdsSjTGa4WvrmBKyW09rgkty23ygVIoDh2uJy6IUtDXWRT6gzGLBQhsmwTEnTtEdW15UTWE3U1dkJC6wCAdN2DulNcUT1R3lTscIggJklfRMmFK8RZOluYkWTK7hHFADWjiuSgA71yQHpLKWI/WndXiP1rIDpnX5Lh0zr8kqL2RsMuI/UnD8R+pY8dNa3JKOm1bg1FMeyNgHYj9SXPiOIWPHTetwal/7xV4BFMLRr+txHEJevxHJZD/ALzV/SF3/eav6WophaNd+JxHAJfxVfgFkR02qn8oT/8AuFbXIEUwtGqOJr8AkOKr8Asp/wB1qfpCUdMnn8oRTC0aWria3AKoxdBx1aEGeljjuaoj0mcTBARQbIixOEIGir85aUZiNqZ+CrqrpKaJfJMK1pIlQGrJS1DaygpvAN0BTbo6rWupqFHMZLgE/DCm49oSeGg81dHCUQ3MDB/tEj3SsS+5nsRhnNvqNxUbaTj+U+hWpp0Gube4I32nn4oRlR1IwTI3eHknYFVh8M8EQWgkSJuCFyu6wa5ojx3yFynZCMeuXFctAOASkLglKAGriEoSuQAkJqemlABOECs6zOwVXYJWlfuFSUijKRKrHBYa4ABc86ACTJ3ABUSANC5aPaWwsVRa2pUoPDC2XEtMC5BzR3dAb8VS4ihHaGh9krT6G012DsdBCtMLhi48lX0aMlanZ2FyhJgkVOOoFugQ+ErFpuARvkSrzaWkAXWbxYLTCAYc3BtcS9gDeU6+A3Imk+P2VVgKxDhcAcYVvUIIzNcCUmBYUcSXCIAIGlgI5lD1gA6Xd0iR5oGnUM6omrpIPqoYh1PwHquUAd96rlIjNlclKRdAxQlcuC56AESuSAJXoA5NKcEiACsErOr3CqzBK0q91Syl0UzdVrOgG1KVCv1tVpdaBBpg5nEadY5omBxWZoMnN4fNlvP/AExw1A1arazASMpbO7Kd3t7KckkosvDFuSo9Px/SDDDCdbUa4sf2cpDAb2IcXuDRrxXgmKptzPYy4zODTINg6BcWNoM8l7pgMRh6repqdUYLiWiox03mzRcfwvIttYNox2J6oDqxVtGgkHN6OzeiwxSqzp8iD4Muyzh4rR0drsAAg6KkxDO3yJn1VzT2ECAc8SF0tr2ckYtukP8A+XpO3Kl2ycz5CvR0fFO+aVUbWoODha3Hclaser1sq6Yvoi8K/K6TomNpTdPamyA+rS/MNCnYd25Nw1233aJNCs2IdUC5LXEhckgKGs0BRI4UR1hDwTwMrquAtLTPHQR66la2U++AMJxCaE9USNSEpSnMpE30GknRA0m+hiQp7mGYF/BMKAoLwSs63dVbgVcMAlrTviw1hSy4RcuEQbLwhGZ7yGtFuJmdPH4VtSq1aGMp9W0kvp5o/VMmPRGswzaTOsqtzBndpjuydC/jxP8AtT9HaVR9ajUrgl2dxzcM3ab5XI8FhOSdm+ODVIvMb0ipYWi134VzKz5a241OpibDwWWOKa3DmAS91Jz3O/ue6SfIZitj002I6vSz0xenJANpEXj58lkdlYzIadN7btlrrfkdAE8CHONjxKyhVG+XZvkpf+Mf1TahbLZs5pkTvB58loabG5A4jQKxwr6YweU5SSHXADQSDERmJMGO1HoqsuLm2NxuBgLXdtGCgovl0hK9cvcADYaqq2jTkwdNyJo0HZiSIE+Kmfh5tA8Tr6JOXJh+SpwrWgm0c90ITFsAdqCVcVKQAA0J1jRVlXDye17K4sUk12Mw9bKSpas2KixLgCIAUsEiSn2QOnzXJmaFyVDG1aAIzEmfyx9VDVpXAFr6uRmGdYXFlJ1oyyYncSJTsadFfiMEwwQTxdvHLwUVbZGIaC40KwaLlzqVQADiSRACvdiYp/X0zTcA7M0TlBIzGMzQQYMGxXoLa+Jpl5ouFQA9yoX5iOTyRGvBT8TU3hi2XJ4xSgSC0O3i6P8Awz6zRDA0Axbj4L0jFbBweJd1raTsPWPegdgnfmYbHxEeazm08M+i91OrkBgEZTIIPdPEJud9A1kUdV0Z2ls17X9lwki6C2js91OHG8/KuMRWcXtaHAaaKTHUppkOJcZ3RJ9U02nZlbrV/wDCl2XTmTuH3C0WxXNp1Mz9TvgHKTYHyVfg6Ia0AaD3PFJ139RjZ7xM+GUpy5PUxYVDHz2y42jjSCItTZGZzu1nq97LlBE2gcOJXoHQapRxVAVZHWtP9Vuha694/SRcHx3gry40RuI9AkyvbZpyzZ2Xs5hwMajksvhopYWjZ9LelVN1RtOiHPpsJzOBgOdFsvEA/mjwnVUmzcew0KrXMqNqNGZtV0FpOYQDfvHdukSqhrXcfhStbxT0Rp8CLHYMODMhdLQSQDeJvE6xvRLhayHpOBFuY8wVLSqTY/ZRRv8ABhLG4fUQVnF2lh7qSq4F3A7v4QlckOiTPseCSjWl3xfRFHzsouL1fosajAWnML6z/KrMQ4gkf7RhrzIPpoqurVlx8d6EmJsFxtLQi6KouJFxZLSwlYultNxHCNUScOW95j2+IWj6Eyvc0cUqkq027lyQiPD02tbafEppaY0zDjvjko3P7MTOiIbiQ2wi2nEIaGnRNQpNEFpIcLgzfyStr4kFxp1akzclxvxmVA6qTJAM8dylbUIEkmfZFDTZc0OktelTDnOLyPykCDfiLqq2rtI1ape7VxkjUNEQ1vgAEymMwIPdkX/YhAY/DljiQS5vH73hJJWdnjZqTT7DhYgjdp/CJl1QOM3a0uIJgloEkDnEnyKr8NiQRGqKwFTsvef0uYOZfmaP/HMfJM68kITp+xhf97gq6sD1zYvF/DcjXOcTAmToI+7Iw4drKL/zPN3O8NAOQukmLycqVR92gClVI/MByKe+oZE8NZtqNU2mGmzhISPw4Dhl4Hf4apmvNErMRJgEFFUnzrp+9vqhWMEiymNvhJm0brkGNQsJO4ukeUZveVYk5gHN1QeIoudTd42HPl5WQ+ycZEA8YPLxRRy+L5Oz1ZYY50tzDcP9+iDp1hB/VlBngFZmlJIjs/VC1cEBL2kC0Rx5BCI87xpSl8SK/f8A2L1lswuNCDrEbkDh6wD7+SPovAGUjT7hQPosedcpG9NHl012WI2s4kNDso5FWFLbZAgkESR+yqHbLeGdYGP6sAjrMjsk/wCcRKpQ+5EynF2DNRVw9KqTlIY/X+0/sUqoKFQ62nzXJtBRHiaYyi+m6EjnDLO+AFA5xgSZGgUlMgiHeSGhJ0LTf2YDo4gohxJAaDNrmFWsdxR1J7suZpt5fCTBMc2pFrgotndh0QdJ3lCU6xdBdF9/7hMdUjs5s1/TxSCnVkL8D24EgzGW5vyV1jcA+mRQDgcgGd397hmd6AgeSk6HYbrcUwG4bL+RiAB6uHooMZVL8XXfuzugzHZDobPPKAm+jSOSceUzsHg8rjNQG26fQp2Iq5BkcAQQZIXMr3vMXvFyharXEhtoPrAO8qEnY8aeSaRBTkNB3/z/ACpmCT4T5Qm4w9wbifbcpKA7Z8vhM9uMeaJHMII5zHpPFKXcQIPBLtAxlI3OC7EtsCNCkatU2kMzA2m8k+U2VXtOnlcXARI7Q4E7/AqwcwEARcaEffMK92VstzWCuWdtjw6SZBp90gsNhGt1SZ4eaDw5OCpdiMobfUXI4AXP3xSZxIPZO8cfIhXVfoq4uLadRswC1rmwIfJIDgRABFrKtwHRvFVczRTADCe05xaJBg5TlJKR3rzINXYNVxXL6j3C23RTZ+zHsp1XNNSsWy9pzFodMEZBYi28FY2psHFBpcWWBiA4Ennbci9l9Gaoc5tQFhLZLgQRpIbbeUNcGObPjkvqemY7pvg6RFNr6wyiD1TWZRBFr+kLBdOcHTqCjjAMjqoIdAAa7IYD3ZbB5uHDi0cZMFPozWa2WwWgSAZDr3IhXeD2YHBtGr22cRLQ0gnhc6pRWrOOeXZUzz2o10xKRbrD9HKdPFEgNdRAIyvvDo57ly12MDDuwL5y5AHCSRofG6nweAcSQ5wADZjU6WVpgqwzPBuHQO0LyQP4UlahF8oFgAAN/NJjAaWxm5QbuJMxIFuCIoUQKbmZRmGaLCbbgd6sWUrDNItebEeX7J7MLEZXWk3IvOpiEUIqK+x2WcxxFtI1tJ8OCN2XgWNBqACXC41I1FpVlSBBkzA0MEW4c0TQFMuAAkaxGo1dFuARQWDdF9muw1PEV3d40x1YBGaMxbmgXAJcBeNLLH1sM5nfa8FxJdzvqI1Wi2fhHU8RWxDnl1JzntjMbv61jQ+NC3NLgOAjmr5leJGXS14i/BDG+DG1sEGU2vIc28Q7WNW+qi3OdpNhxG5anpBjGijlgZ3wGjeB+Yx4W8wstV/K1Sz0vAx8ObBNoG7PFFYTvnwHwg9oGXsHMo3B95x8B7BL0d0HeR/v/gXaJ7E8CCiIBblO/RDY27Cm4eoTTHFoHtb6JejZy/W/2Ialonc7I7wOh+Fs+iu1w6m+hU74t/kJ1PMW9lksewOYXDeBP0P3yXYSuS1lZtnCzvhM5M+FZLj+Uelsw7GOEO7ZiCdMsTBHmjTigGmbAAWvBk6Ss1s/ajKhzFo7saiSQAOHiuo46pFQkQSCYNgANCOHLwTPEacXTNH1AuWXkTAvO+3BRMIdMgkEyIABBjuk8dVSP2s5pcO20kQDaTYZY5SL+K5216ZlplnaBmdHwbn1RYi3cTma8gAaT+e+oI8YTKuLa2owlh1yu5WMX4wFUP2nm7NTMGtcCMoFzwvrGqkDQZLj2nG4sDBu3LfkUAF1ngghoL6bjmsbhwkEE8N48FypDjRBa05QIBJJzEwSbeYlKgAMCkwENBEGZJJg79VM+oGAEEmd2sg66cFmK2PzuytbG6BGp0JKndizTkwWkMAbNxNwSPT3VjLrEOaS3NI8ZEtixHC8eqixeMPda61jIi58BruWfxeLMNJLs2XXd9lLg8cRJJgQbxy+ygRpG4lzZnMRaAO1I3nkrHY9QjPUgf02OcHay8SWA77wR5rCPxFWJBPEEHd9FcbA6QMotfRqCW1LOeJJDQBENGpDmyL7zKdAuzR4miKWDaxzhI/DuMzIL3mpfyhBfjBBLiA21wdTNhIUXTDpJh8U2p1OaXmmYLcoAZnEeABYFlBWloYCZOo3eKRdbySRb1sYa1Q1CSQOyz/EaIZ7u15FPaMrYUO+Vme9CGkVFAVd01Y4CPv1VrhtHHmfayp8L2qpPP6q5o9yeMn1TkT43LcvuyLEGwHEEp+CgN8MwPkR9CoMS6CzwKloDKR5/H8KfRsn/EHUI7dM6D/6u/b6KDZIyvfSduPz9+6dXOWox24iD4fZSYtuV7Kg/wAHf/k+aZnLh39H/ZhtDsuyE2JBB4c/dW1Z4Ic0XbAaSTGZ1oJBtENVQ/tiRqERh8WLOeZiAGkTmN487/KEcXnYP6kfyH067m9g37oBkG14jlb4UFOt+U2Y/skkbm7x52SNqAtgnvAidCRqNLfVR4PEvLXMqR2ZmJiLRPOLoPMLLFF72ta7QDM115Ai0jiSh6FQtIDmgPaBc6OjdyiShG4mXtBqOLpFoAOUbxa4uBdGOdnDhmglwc1piSbHxvCAI2Z2vcRYRMgbzG485XKBr4a57zlcYmCZmYXIAzjibEubDhcN1EaW1C7D1WzDiYAsL35QeP1UNKu5s2bEk7vbko8M8kGD5RfyWpITUqBstc0tm4BE6nem18TnF290RI0AneE3LVeILC4XgwZ8ymuwtQ6MyCL9pon1KYySnWDWkMJvoSfomYaq1xyEAmddBf8A2lp7OMQXMA/yBPsk/wCPaDeo3nZx+iAoncWB0AEkWEaeoU+EoXzG/wC25RYfCNzZg4nlED5R2llEmel4WH+d/gSoUNWf2SVK91lW4x0SBvt6KUjsyz1i2SbMbeVbkQ0DgEFsynYHgjH3Sl2aePDWCBMbqzw+qmr2E8CD9+qi2ho1T0e0wjkUvRS+dobtBssBXUYqMyn8wjwcLtP3wTx2qY8EBh3wSNP33JroWR1K/TDMJV0nUWI5jVFkQcw01/YhB1u+HjSoL/5DXzReHf8AfJJhHlast5pkTe5B1A08OajbXpgnMdZnM4QZ4jgq/E5AyagJYDMCfC/K6Ew76J1a0U4JNQAwDaxCpHj+RjWKepb1MXhQ4PmnmGhm/wApK21sPIcS0njlJ94VdhMVhiWgMaYkHNPa4QPdI3DPLnkgGmO6G8SPpxQYbfYsDt2lBcATpJy+mq5A/jB1ZDiC0QA0NBcebp8ClQGzKp+0mDQ+jf4UD9qc3fCDBA1E6iUgLd60IsJONnUHzKYcTOgHND1ACZHpwUd5TFYaK7om0LqVVznAA7/ZC6FLT73ogafPJo2MyhMc5V5xDm9kkkHTiPPeiG4kEXtz0+Vk0z2sWfHJVHgfMmFWPdLkUa8AxrP+lHgcOZ7QhNcGeSSm1FFrh2Q0BKCnOG5MpLM9FcKiDG7uSfs11ioMdV0CJwTbeSr0YRd5bQ/CGWRwke6r8QIcisJWDSQTF0Ji6zXEls25EIiTlnHVK+foGYftMLd47Q8tfvmnUasQULg8axkEm43cQmCuXS5reyPYTaU6Mn5EIpO+S7qMzNLYJBEwNbaEKHGbLeaWSkHAEjsmLSZMp7qjxSa9hgkAm0yADYKmqbVquIGdwJ1uAPWERTOHy80ck7RabL2I5gOdgJtDs2ngFaOowB22DTWwseXJUOHZoXvqG+8kgXjdZc3CNN4BMu1M6FNnMqLmoyh1mc1GAkXAj24BIsycMIzcTFtUiKHX2IWYarBBbrvJCkp4S1yPXRQuxLuKh64mdfVaGYW7CD9Y9E51KnoXacICr3Gd6UmLIAKcKMzJPn+wThWpSIaZ80CXynUO8EDLCrUAiQD4plXHkCwEFR4/UeCFdCANP0V2WcQHP0DXNAA0J1M/+K3Lej9HJLmAIL/05wsYVrou9z3H1y/DQrfpdierwtUt72UtbGuZ1h8rlnzI7sbqFs8nxOJD6jshIbJya90aT4pnVyQM0ff8J9PAvIByGeGiMpbIqGDF/vgt+ji5YLhaILw0n7mF6DsHotTdBc5zhwED+VmKOxqpIJj0PkvRuiL5aAdRY+IWOW/R2eNOUbMT062TTw9duVsU307NE99puefeYsViWkmT5L2bpvsn8QGACS1x9CL/AAFnaPQsnVnqrg3RllitmecinvOiJoOyhwjX0jVelUeh7RuYPRSno3RiHOYQqtmeqMfh8xosDZuIMXMJMPs6o4tzUZi5mLnjrMrc4XZOGpjsnTxKe+tRbqCUuRtL2YhuxK+f+0CBe/giML0eqggkjU6A71rBtCluZ6lOqbaDR2WNnnoimw2SM7hui7gBE+g80qvae3qxEyB5JVWpO6PG6dMuBPCF3UP3Ar0RmxsOO84eQJCkpYfBzYF8XtlHnc6KrJo86bgKh3IinsqqYEexW8xGNw7R2KUkc1VV9su/LTaPG6fIuCip9Hqh4+iMpdE62rRfmrOhtauSYLR4D90Q7aFeJNZwHINH0RTC0BDoo83qZbfe9Ss2HSbqW+iZiOucLvqO/wDlb2KEOCef5KKDY9K2DRDKTWjQCyA6QYukXZHuFrwrPBENpjgB9Fhcbi89RzjvcSJ4bvZc8FcrOrLLWCRZtxWFHE+AUrNsUQYbRceZgKjpid07lPSoOnQ8lvSOXZl43be4UmDxP8I3o5iiar5gSZgaeSoTSyiSY8YR+w6oFZsHX7H1UZF+k1wyexpekNfIGmYlwHsf2VFWxrnd0n1MfKsumJ/ps/yHwVnG1jyHmEYvlHn+YsWVQNYPynurKr608vdOFfcrZirDnPQe0XWCcyp4+o/ZNrtD9R8/ukMFpVE5snSVK2kBuCflPEphQNRzAd0/HyuRQZ5rkWGqMw2gCZI8rKUtAITADxA++QUgbz9lVkULWA1Jgfeiq61Qbvf9lY1MPOpd7fsofwbRMgnmSUWOhMGQFJja3ZI5J9FgH5QQp+qDrW8z/KAokoVi2wHiEVhi94BDLTB8ZQNLCOaZDm23Egj+PJWuyS4uy87w6R6QpbpFRVsu9rVS3DkN1IgfCytfCuygvdAtfKNeA04LWbUa3qiHHKMpvwO4+qyJqW7Rc7gNAPABZ4ujbP2gjCua1uUSfGBKINffB9f2QDHj7KnaPNamA5xH6R5iflEbPf8A1G6C40AHwoLcCitmUwarBzUy6ZcPmRfdLhmZTnj9FmOq+wtptXC56QGhEEeKyrWwYuoxPg0zp7WQMCkAT3eajcQtTEkDvBKagUBrBpuQPlSsId3TPhdIB4qt3gohsai4+9yiZg3HcYTxs9/EDzKAFeOFguRDNnuPeePSfey5AGQa4bk/LyUPWHefWVzXDkqET+nl/CXqj5clEHqRj3Tb0QAvUEgnh4DfuvfyUb5GoHz8IgvkWMHnp67vP1TKlGobdr3O5AhtOrxAWr2Ts9zGtcRGcZh4bv8AXNZbA4f+o0vBABvm7vmDulbz/mRDibANm4Gp0A3HyWeR8UbYlzZnukGK/qBvAD1Vc4NP8IzEU+se5xdE7oBt6pKeCpz+Y+OicVSJm7bZXupxoCfn0hNGII3Qr9lBgFm+ZkpamHadwnkFRBU0K+YWMeSsNj4f+q08/oo6tODCuuj+FaB1jrTMeUfv8KZ9GmPmRdbRdlpudwG/TksZ1JO/79VrdtVWmgROpEc4N/hZunWaDlJH3wWePhGmZ2wdlE3+hm30TW4Yxr4jl6o91Pe0en8LmNA+x98VqYUQUcKyB2BwmPe2qk6sC/wpi5u+xQtcg6OEcSPXXVMQX+KDd8+Nj7qRuOYd48dyqW4kCIAd4QPv2UoxH/tj5/ZAFuKoF5lcqtp3gub4R9QuSGUTNmP5J/8AxPP2Hyrd0aynJ2IrqezWgcfEz8IhmBZvb6yR6IocVI0DigCCnRA0AHkFIafO6jdimN1c0eLgPbVMG0aMx1gJ4Qb+eiAExOCziJPiLFQUdkuGr3EcwPoixUntBjo3ElrR8lSDHeE+MpNX2VF0Mp4GBCmGHQj9pOB1bHICfdNOJJvmLp/LpHiJQIPfTI3wo2Ypo1t98tygYQRpf1+E4Nm0ffmgZ2LrUn3FT0090CzatSmQCHvYNAMpAmJs4jgPRFuwzTBLZ++KIo4SkLhoHK/ylJWhxbTtEbtpOe0HK6f74396wJ1KrsZUqDtNZI35dfMHXyV26gIMA/T3ChaZE/fslGNDnLbsrdn7QDyBJB4aenFH4l28ODvfySV9m06gDoIcd437tOKjoBlKzngcjr5DyVEiMx7dHSPKWptSswDeDu1LD5iYRP4ai45jLvu0BBtqUh2YcbmM0ATw3piZCdlvcc4LROuUkNHkDf2TcHTHWRn3wbEXjQyrbC4gDutAjW5/ZPOMdc2nw+uqBEGJcWkANkcr3+VymZUcd/kCQFyABmHVStYEq5AC1m2P0JVa6qTIPwFy5MBmGeSL/t8KCph2x3R9lIuSAhNkVT3cwuXIBBdOk2xhK1oBsuXJFMTFGwO/MB5QpKW/73rlyAJna+SSiL+vwkXIEFA2KAq1XSRMRGlj6hcuQNgj3GdT5kn5XE5mPJuREHfr7rlyokgwuJeJupsQ8lszey5cmIK2bUJ1O8K2YJcZuuXKRkgoNnQDwsuXLkhn/9k=',
      ),
      Product(
        id: '8',
        name: 'Knit Sweater Dress',
        description: 'Warm ribbed knit dress for winter',
        price: 55.99,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrWFKZLRhn41byJTXPDRvVhUwLPIde4rRdJw&s',
      ),
      Product(
        id: '9',
        name: 'Boho Maxi Dress',
        description: 'Flowery long dress with tiered skirt',
        price: 52.99,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQquy7MuzxHg7ywuRKNHYi8ZzPp_SxiaNK9jA&s',
      ),
      Product(
        id: '10',
        name: 'Office Pencil Dress',
        description: 'Professional fitted dress for work',
        price: 49.99,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xUtMjIrsAhWvN3lBlVdlV80rPnV05XuLHw&s',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'ELEGANZA',
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              // Implement search functionality
            },
          ),
          Consumer<CartProvider>(
            builder: (_, cart, __) => CartBadge(
              value: cart.itemCount.toString(),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black87),
                onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CartScreen())),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            FeaturedBanner(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Dresses',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ResponsiveLayout(
                  mobile: ProductGrid(products: products, crossAxisCount: 2),
                  tablet: ProductGrid(products: products, crossAxisCount: 3),
                  desktop: ProductGrid(products: products, crossAxisCount: 4),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class FeaturedBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: index == 0
                      ? [Colors.pink[400]!, Colors.pink[800]!]
                      : index == 1
                      ? [Colors.purple[400]!, Colors.purple[800]!]
                      : [Colors.blue[400]!, Colors.blue[800]!],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index == 0
                                ? 'Summer Collection'
                                : index == 1
                                ? 'Special Offers'
                                : 'New Arrivals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Discover our latest dresses with up to 30% off',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87,
                              minimumSize: const Size(100, 36),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Text('Shop Now'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final int crossAxisCount;

  const ProductGrid({
    super.key,
    required this.products,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.6,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductCard(
        product: products[i],
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: products[i]),
          ),
        ),
      ),
    );
  }
}