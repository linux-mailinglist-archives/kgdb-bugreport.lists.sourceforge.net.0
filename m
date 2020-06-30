Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6720FB01
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jun 2020 19:50:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqKOT-0003iL-Hy
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 17:50:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.carpenter@oracle.com>) id 1jqKOR-0003iC-Jx
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 17:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47oPIkAoYGINH/ZlK07IBm8ApOnTX4Rfb2I0F9A7Bsk=; b=BZrEYHiQbHfGHW4cnVc1AhzqAe
 6Dq1gpf+oQZekWJwamy0ZM3SaOlP/o7JzOZ3nD39kb8uB7Wq/Ia45B0vuHb6DF9K2kdK5DTSWmCEO
 I9x8YIzIIGlE48DOoD3URfm16pbNNe3puW1sMZsnH0nuZhP9Rcp6dVdX8CkFe5ARCMAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=47oPIkAoYGINH/ZlK07IBm8ApOnTX4Rfb2I0F9A7Bsk=; b=k
 CwTLNKs0Lp95YW7QDF3ZVSvvTSrXiPkfi4acGaYzKjMXkiplUUtHGOBUHPxe12p4P/Kk32mjRi3mS
 wfK0KTr2th7JWIeHGP+IpHutZGjuny+XockIuJXBxVTmcnBjX5tB9g820tE38kkuDT/w9F8HWluxQ
 gPhFYssSeKckSrj8=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqKOO-003LkB-84
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 17:50:03 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05UHmAls029071;
 Tue, 30 Jun 2020 17:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=47oPIkAoYGINH/ZlK07IBm8ApOnTX4Rfb2I0F9A7Bsk=;
 b=kPWPVd46qSNJNM3kpU3nZ5cmegMXkRmUwXlNkkIrEsZLiK4IkWrcH4P96xveXE+nF5Ps
 GWqHSDwrryYH1sO9/CMHnoqJaBQDOGG2zm7Qj5qYpAUBizI8FLeKlOkahHEQFUDzXfpP
 69OtpTcJQ44OGCqZ3T1YFYJ0k/X3RVQYgXqGJitpjS5ToVrJVzhcdbrZYlkpHrCBhaHW
 RNLCI3FJLZdWBRiYjc7BvLHNyb7b30W+qG/jebEckRgDlVJDcGN0zTgWwUyArqp1/4kl
 W9KdGdEzUNTcGJ7+442tll4hkxpLpxSgCSIRoZT17Jo4cfZ3Kbo1mc7+qyvGA1qYXDJM Aw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 31wxrn60p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Jun 2020 17:49:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05UHmmWo166942;
 Tue, 30 Jun 2020 17:49:49 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 31xg140fyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 17:49:49 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05UHnnXV031237;
 Tue, 30 Jun 2020 17:49:49 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Jun 2020 17:49:48 +0000
Date: Tue, 30 Jun 2020 20:49:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: sumit.garg@linaro.org
Message-ID: <20200630174943.GA34614@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9668
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=589 suspectscore=3 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006300122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9667
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=600
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 phishscore=0 adultscore=0 cotscore=-2147483648
 lowpriorityscore=0 suspectscore=3 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300122
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [156.151.31.85 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqKOO-003LkB-84
Subject: [Kgdb-bugreport] [bug report] kdb: Switch to use safer dbg_io_ops
 over console APIs
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
Cc: kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hello Sumit Garg,

This is a semi-automatic email about new static checker warnings.

The patch 5946d1f5b309: "kdb: Switch to use safer dbg_io_ops over 
console APIs" from Jun 4, 2020, leads to the following Smatch 
complaint:

    kernel/debug/kdb/kdb_io.c:565 kdb_msg_write()
    error: we previously assumed 'dbg_io_ops' could be null (see line 552)

kernel/debug/kdb/kdb_io.c
   551	
   552		if (dbg_io_ops) {
                    ^^^^^^^^^^
Check for NULL

   553			const char *cp = msg;
   554			int len = msg_len;
   555	
   556			while (len--) {
   557				dbg_io_ops->write_char(*cp);
   558				cp++;
   559			}
   560		}
   561	
   562		for_each_console(c) {
   563			if (!(c->flags & CON_ENABLED))
   564				continue;
   565			if (c == dbg_io_ops->cons)
                                 ^^^^^^^^^^
New unchecked dereference.

   566				continue;
   567			/*

regards,
dan carpenter


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
