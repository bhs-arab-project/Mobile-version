part of '../../uis.dart';

class Inconfirm extends StatefulWidget {
  @override
  _InconfirmState createState() => _InconfirmState();
}

class _InconfirmState extends State<Inconfirm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.orange[400], Colors.orange[200]])),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70, right: 40),
                    height: size.height * 0.23 - 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      SizedBox(height: 60),
                      Text(
                        'Quiz',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 40,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Intermediate',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 560,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 50),
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                Text("Accept License and Agreement",
                                    style: TextStyle(
                                        fontFamily: 'Mont',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 25),
                                Text(
                                  "THIS APP IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black54),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 80),
                            RawMaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              fillColor: Colors.grey[400],
                              child: Text(
                                "No",
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/intermediate');
                              },
                              fillColor: Colors.orange,
                              child: Text(
                                "Accept",
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ]));
                },
                itemCount: 1,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
