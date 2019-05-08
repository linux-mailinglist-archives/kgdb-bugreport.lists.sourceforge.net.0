Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C91745A
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 May 2019 10:58:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hOIPK-0008C3-Tu
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 May 2019 08:58:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.carpenter@oracle.com>) id 1hOIPK-0008Br-Aw
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 08:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZbtC6yxrJKtFmkHsz60DLF4OuODsmR7iM/zJQTa1o8c=; b=Xcz3MfWDFseuUHhC9g+qhEe6Xt
 ZJ6Ey/4HsWK7Pcng+3D+OHjRD+QYgiYBORcO/gjo3RCmLnUMoIOajyorcFcsE4mmAbGAsvVLrwaCv
 0Z0bc3PwKIrXAaZ0BV0bINsmL4uFDRrdkWpDQ5RZDeA69z2PLeE/yW+Jb8jfS+PCv3v8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZbtC6yxrJKtFmkHsz60DLF4OuODsmR7iM/zJQTa1o8c=; b=Hg31j8g7MbuPNlzEniWCz9LeAW
 GO00+OXEBIt8NYsaPI1YMXhn2Ksw88k+MZcQWwo6MW3XML6b+WiojuUiy1/aUZyfKgsvuLcJLujhA
 g75A1Uit87ttd3up9OVFtmO+OlgiPOSGhMz5lYIkm73Yqinlc5TXzlsuUT72lbw+s80c=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hOIPI-00CtcV-A6
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 08:58:34 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x488t7fI125786;
 Wed, 8 May 2019 08:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=ZbtC6yxrJKtFmkHsz60DLF4OuODsmR7iM/zJQTa1o8c=;
 b=saFiBsdntlAdQwZLKECShMWMT3XWIUkL2aiO3L3BhnSc5DFgvY5yRK0DjQ6i67vf2kRs
 uBQI4HEtvfkDclzqp0EoEshT5m7DV8Uva/4XE7Idm19B+bduPSpgmR4GYLL7gyiNpsLL
 QlvgwolyfoFuUKwXg19dbF/FODC/QWtznYn8/7DpBS4ayJUW8n3PgYRNPtgufgbVhgKQ
 y3u5HRYTCPRyfdxRyFwuIGJnrZCeTpqYOSvMM4Orml2c127o2Di1tFxcxIpc1GPNiHKi
 ybIwUCX0Qq8GWS2I4gBfaqhHnF9JYE2xHSFHC0HVI7Me0oY+lwIhnNq+Y7DQGghL/Iw7 1g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2s94b0tey8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 May 2019 08:58:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x488w8vD096402;
 Wed, 8 May 2019 08:58:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2sagyue4th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 May 2019 08:58:08 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x488w0L1010675;
 Wed, 8 May 2019 08:58:00 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 08 May 2019 01:58:00 -0700
Date: Wed, 8 May 2019 11:57:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20190508085752.GY2239@kadam>
References: <20190506125018.GA13799@mwanda>
 <20190508084838.w7t3nwamobpmwgkv@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508084838.w7t3nwamobpmwgkv@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905080058
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905080057
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hOIPI-00CtcV-A6
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: do a sanity check on the cpu in
 kdb_per_cpu()
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Nicholas Mc Guire <hofrat@osadl.org>,
 kernel-janitors@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 08, 2019 at 09:48:38AM +0100, Daniel Thompson wrote:
> On Mon, May 06, 2019 at 03:50:18PM +0300, Dan Carpenter wrote:
> > The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> > cpu in a bitmap of online cpus, but if the value is too high then it
> > could read beyond the end of the bitmap and possibly Oops.
> > 
> > Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Just out of interest... why isn't this copied to LKML? Omiting LKML makes
> the patch hard to find in a patchwork instance.

Sorry, I wasn't aware that anyone was using LKML for patchwork.

regards,
dan carpenter


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
