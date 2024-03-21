Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C3885536
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 Mar 2024 08:58:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rnDJi-0004is-Av
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 21 Mar 2024 07:58:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rnDJg-0004im-JI
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 21 Mar 2024 07:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FOxNEXZ9LoI28qYyifvU8qUpUyH83SG5h8zuxJ0WK3w=; b=X17hjrHmO9XaXdbObDZ2RElIt/
 G22RzoASZWcfJmNM/3l2O8xDJxIyR8/yXzkHcGrMEWuL5aNge/i9npPcJ9H9dcoG//bhkkCpU4Gwb
 Jo2gNeBCh27B5ZTUsYY5sdiAFPkAQ2BDlW0pFMA/ea2de2+LIydK706NXcEGXwlw6U2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FOxNEXZ9LoI28qYyifvU8qUpUyH83SG5h8zuxJ0WK3w=; b=ikuVjDhzvgzhIaEpeGsmUCmcL/
 ndHKVZJ0qskdYLCxoIW6dvguYWGgSNaVEHQyXe5hFWymuwyl1CpCEH+j+6j7LQzeYJkL2NW+sgpf5
 3zsfkzfBdtVbjt7CDPuDKrr0EtwR4p1CIABPDUXyLKmKiNVg75NYQLekjanl1S8ytHa4=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnDJc-0003EQ-CB for kgdb-bugreport@lists.sourceforge.net;
 Thu, 21 Mar 2024 07:58:24 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 42L7vQPX052728;
 Thu, 21 Mar 2024 15:57:26 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX03-IMDC.srv.huawei-3com.com (unknown [10.62.14.12])
 by mail.maildlp.com (Postfix) with ESMTP id 59DB42004BAA;
 Thu, 21 Mar 2024 15:59:08 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX03-IMDC.srv.huawei-3com.com (10.62.14.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Thu, 21 Mar 2024 15:57:28 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Thu, 21 Mar 2024 15:57:28 +0800
From: Liuye <liu.yeC@h3c.com>
To: Greg KH <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH V3] kdb: Fix the deadlock issue in KDB debugging.
Thread-Index: AQHaezckCXAchSVaZ0+2QsrTyw6AgbFBSNsAgACKiZA=
Date: Thu, 21 Mar 2024 07:57:28 +0000
Message-ID: <3cb0b32b8b4946efb93ce68729d4c321@h3c.com>
References: <20240320162802.GA22198@aspen.lan>
 <20240321022604.4088438-1-liu.yec@h3c.com>
 <2024032137-parrot-sandbank-ab29@gregkh>
In-Reply-To: <2024032137-parrot-sandbank-ab29@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 42L7vQPX052728
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > The stack trace below shows an example of the problem. In
 this case > the master cpu is not running from NMI but it has parked the
 slave > CPUs using an NMI and the parked CPUs is holding spinlocks [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1rnDJc-0003EQ-CB
Subject: [Kgdb-bugreport] =?gb2312?b?tPC4tDogW1BBVENIIFYzXSBrZGI6IEZpeCB0?=
 =?gb2312?b?aGUgZGVhZGxvY2sgaXNzdWUgaW4gS0RCIGRlYnVnZ2luZy4=?=
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


> The stack trace below shows an example of the problem. In this case 
> the master cpu is not running from NMI but it has parked the slave 
> CPUs using an NMI and the parked CPUs is holding spinlocks needed by 
> schedule_work().

Add description information 

> Signed-off-by: LiuYe <liu.yeC@h3c.com>
> Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

Add 
Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
