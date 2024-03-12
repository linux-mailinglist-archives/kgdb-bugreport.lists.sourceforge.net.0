Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D8B878FD1
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Mar 2024 09:38:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rjxea-0000ml-4E
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 12 Mar 2024 08:38:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rjxeY-0000mf-SH
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Mar 2024 08:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=484fGHYCkSxYD6mCMfudQ6WkbUe/ZMV3OusJdX8NaVg=; b=BFxaJysAmnVrmYDqF/lIPCN+bu
 b2Xc0TFfJZxQoGnrTL5XV4zRpRvSYqeiCgkrtaYgNyA4XbfG5VuRsa7wuAaxh9suaYh2ZyHF2UkDx
 3R5cdNufUGfvXQUS1xoWmuVmRHonmxHyTnG94t1wUSJI4BLFu8Gg6x5t+HZKorcrae/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=484fGHYCkSxYD6mCMfudQ6WkbUe/ZMV3OusJdX8NaVg=; b=gR+aTSa+5F0csMQlogQbE7wf/j
 ZOoCsM3lh8FvfxoDkHNtCggJHD+L73AI4aK/Kzvf1cJsAuuI5HManClPRzKK1jTrTjPkRTlCGdgNA
 GclxDYF+6XeXcFXK20cjYPP4J0m+x1ZTMLSyufkm6Nm9U42OuWqB5OXbeOFvod2INWoc=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjxeN-0005zQ-Pm for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Mar 2024 08:38:31 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 42C8bAQO064331;
 Tue, 12 Mar 2024 16:37:10 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX12-BJD.srv.huawei-3com.com (unknown [10.153.34.14])
 by mail.maildlp.com (Postfix) with ESMTP id 9B02C2005153;
 Tue, 12 Mar 2024 16:38:39 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX12-BJD.srv.huawei-3com.com (10.153.34.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Tue, 12 Mar 2024 16:37:11 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Tue, 12 Mar 2024 16:37:11 +0800
From: Liuye <liu.yeC@h3c.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Thread-Topic: =?gb2312?B?tPC4tDogW1BBVENIXSBrZGI6IEZpeCB0aGUgZGVhZGxvY2sgaXNzdWUgaW4g?=
 =?gb2312?Q?KDB_debugging.?=
Thread-Index: AQHaafG3YC/Li+j42kau1FDQhHr2m7EfIsgAgAMadaD///fWgIAJrHcQ
Date: Tue, 12 Mar 2024 08:37:11 +0000
Message-ID: <2ea381e7407a49aaa0b08fa7d4ff62d3@h3c.com>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
 <20240228120516.GA22898@aspen.lan> <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
 <20240301105931.GB5795@aspen.lan>
In-Reply-To: <20240301105931.GB5795@aspen.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 42C8bAQO064331
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I know that you said schedule_work is not NMI save, which
 is the first issue. Perhaps it can be fixed using irq_work_queue. But even
 if irq_work_queue is used to implement it, there will still be a de [...]
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjxeN-0005zQ-Pm
Subject: [Kgdb-bugreport] =?gb2312?b?tPC4tDogtPC4tDogW1BBVENIXSBrZGI6IEZp?=
 =?gb2312?b?eCB0aGUgZGVhZGxvY2sgaXNzdWUgaW4gS0RCIGRlYnVnZ2luZy4=?=
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
Cc: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

I know that you said schedule_work is not NMI save, which is the first issue. Perhaps it can be fixed using irq_work_queue. But even if irq_work_queue is used to implement it, there will still be a deadlock problem because slave cpu1 still has not released the running queue lock of master CPU0.




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
