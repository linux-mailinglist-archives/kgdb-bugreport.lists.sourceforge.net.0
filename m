Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CACBE14A3A
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  6 May 2019 14:51:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hNd5H-0000Ln-JO
	for lists+kgdb-bugreport@lfdr.de; Mon, 06 May 2019 12:51:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.carpenter@oracle.com>) id 1hNd5G-0000Lh-Pf
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 May 2019 12:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZqgoNDVMow9tzy6yMM0RxqKAEBnofHDY9EXOg2QtaG4=; b=fvIjRFYq+ktKvYT2dzxxpuanMC
 y9v58DcMZhahKvyhYH2axi94YZ5294kkfy3vERC3Bmexo3rAD2b1jM06NLvAGdXeGcHLKfGraYVJw
 gakrHI3FrMlp/BnmZbbMHyDv8vL/ktPbsE3AyqpEt5AilHJlnGzRltKL416S309Wyz8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZqgoNDVMow9tzy6yMM0RxqKAEBnofHDY9EXOg2QtaG4=; b=D
 ICjszfjE6OAPqjk4a0ads5iga647OYygSSH4+49x4dcEvdWpyj4dRi8+9RSPgB+s5V08obYVCq2fc
 IvHAakBXy9Bfq50KYvaWgfpvaVH2r+s6rLVpOcyaXgVknlV648azbfxH/n9SwdnWWFgJBPxwf2oB+
 SxHKKJBDv7ISUSOc=;
Received: from aserp2130.oracle.com ([141.146.126.79])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hNd5E-007F43-Qx
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 May 2019 12:51:06 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46CiT9Z158006;
 Mon, 6 May 2019 12:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=ZqgoNDVMow9tzy6yMM0RxqKAEBnofHDY9EXOg2QtaG4=;
 b=XD+I3u3AGiYylFXjBBaOZndm1bgZHoBMYi4dJgJet/w8J6qdpyxfF7tPeb/FpA0o89lE
 tS1HzWDjKWgF5lRvTh69kDq4bfKLDakF78BiwWbIhgB/WC9xK4x7YBXB4p1UBiTGWoqT
 EXoYROIIDxD6WX5KgBfn/oIc+KTpXu+CCx6FjAx6Tb7XG6WueWa30ErnDFVNy7hlRLMw
 4iVa6ETSt2RJOKSmQv3L3EjmxrARf+qEoVtWwym7xCx9WcF5lelac4kzhFlL0GG3EZm1
 Yg5txZifDv7s/+luNzjXvb+e3WeIiV14QFnEJvp3tA+gCiwua6oREj/SF7UC1RA4A234 3A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 2s94b5p8yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 12:50:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46Cno5N094544;
 Mon, 6 May 2019 12:50:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2sagytbdqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 12:50:36 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x46CoS2T001968;
 Mon, 6 May 2019 12:50:28 GMT
Received: from mwanda (/105.52.123.240)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 May 2019 05:50:28 -0700
Date: Mon, 6 May 2019 15:50:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20190506125018.GA13799@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060112
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905060112
X-Spam-Score: -0.6 (/)
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
X-Headers-End: 1hNd5E-007F43-Qx
Subject: [Kgdb-bugreport] [PATCH] kdb: do a sanity check on the cpu in
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Johannes Weiner <hannes@cmpxchg.org>,
 kernel-janitors@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
cpu in a bitmap of online cpus, but if the value is too high then it
could read beyond the end of the bitmap and possibly Oops.

Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/debug/kdb/kdb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index fc96dbf8d9de..9ecfa37c7fbf 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2583,7 +2583,7 @@ static int kdb_per_cpu(int argc, const char **argv)
 		diag = kdbgetularg(argv[3], &whichcpu);
 		if (diag)
 			return diag;
-		if (!cpu_online(whichcpu)) {
+		if (whichcpu >= nr_cpu_ids || !cpu_online(whichcpu)) {
 			kdb_printf("cpu %ld is not online\n", whichcpu);
 			return KDB_BADCPUNUM;
 		}
-- 
2.18.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
