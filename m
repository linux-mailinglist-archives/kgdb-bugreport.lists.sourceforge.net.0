Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C3B87B849
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 Mar 2024 08:08:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rkfCH-0000Kx-BY
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 14 Mar 2024 07:08:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rkfCF-0000Kq-EB
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Mar 2024 07:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHQmqpvBmzUmxKyyeewCBIRvDYNSD5Sb7pCTFIjAXyw=; b=VBney79EtfS9MWcbmoWAhDZlRS
 T6ptELC3yjUwrEojdVqZd2yWwu3RBaHabWfQE+gyjH08GFPgLqgpYI3oZjI/h6eb/X/nXJ5uG6ayV
 apBPLNEOu8QzGrHuDF4GkAGr6TDcj6oferhXOO/TnIt6Mv3gft7h4R5BNKaHTA+M+YHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VHQmqpvBmzUmxKyyeewCBIRvDYNSD5Sb7pCTFIjAXyw=; b=Vb/yG/49buz/SWBZ+m9lfUoYui
 YvYKPE6KZ88a2qHWMJ+1Ynb5NHjW/2s20uEIRK1+Q0NEKOMhEXgcVXZGPPR8APUVNdbiB4OeJRqRc
 9HeO1vlzivDwJ/fBsYc204yRwsXapZYGyEenw+yUdlpBQgqPw30FMVQnorXoI6UMq6Qg=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkfC0-0000w9-BN for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Mar 2024 07:08:11 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 42E76L3B099275;
 Thu, 14 Mar 2024 15:06:21 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (unknown [10.62.14.11])
 by mail.maildlp.com (Postfix) with ESMTP id 582D3200BBEB;
 Thu, 14 Mar 2024 15:07:53 +0800 (CST)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) by
 DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.27; Thu, 14 Mar 2024 15:06:22 +0800
Received: from DAG6EX02-IMDC.srv.huawei-3com.com ([fe80::4c21:7c89:4f9d:e4c4])
 by DAG6EX02-IMDC.srv.huawei-3com.com
 ([fe80::4c21:7c89:4f9d:e4c4%16]) with
 mapi id 15.02.1258.027; Thu, 14 Mar 2024 15:06:22 +0800
From: Liuye <liu.yeC@h3c.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Thread-Topic: =?gb2312?B?tPC4tDogtPC4tDogtPC4tDogtPC4tDogW1BBVENIXSBrZGI6IEZpeCB0aGUg?=
 =?gb2312?Q?deadlock_issue_in_KDB_debugging.?=
Thread-Index: AQHaafG3YC/Li+j42kau1FDQhHr2m7EfIsgAgAMadaD///fWgIAJrHcQgAeL+QCAAIb8YP//gGOAgAGAGvCAAFNzgIABn6DQ
Date: Thu, 14 Mar 2024 07:06:22 +0000
Message-ID: <56ed54fd241c462189d2d030ad51eac6@h3c.com>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
 <20240228120516.GA22898@aspen.lan> <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
 <20240301105931.GB5795@aspen.lan> <2ea381e7407a49aaa0b08fa7d4ff62d3@h3c.com>
 <20240312095756.GB202685@aspen.lan>
 <06cfa3459ed848cf8f228997b983cf53@h3c.com>
 <20240312102419.GC202685@aspen.lan>
 <410a443612e8441cb729c640a0d606c6@h3c.com>
 <20240313141745.GD202685@aspen.lan>
In-Reply-To: <20240313141745.GD202685@aspen.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.188.68]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 42E76L3B099275
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On Wed, Mar 13, 2024 at 01:22:17AM +0000, Liuye wrote: >>
 >On Tue, Mar 12, 2024 at 10:04:54AM +0000, Liuye wrote: >> >> >On Tue, Mar
 12, 2024 at 08:37:11AM +0000, Liuye wrote: >> >> >> I know that yo [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkfC0-0000w9-BN
Subject: [Kgdb-bugreport] =?gb2312?b?tPC4tDogtPC4tDogtPC4tDogtPC4tDogtPA=?=
 =?gb2312?b?uLQ6IFtQQVRDSF0ga2RiOiBGaXggdGhlIGRlYWRsb2NrIGlzc3VlIGluIEtE?=
 =?gb2312?b?QiBkZWJ1Z2dpbmcu?=
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

>On Wed, Mar 13, 2024 at 01:22:17AM +0000, Liuye wrote:
>> >On Tue, Mar 12, 2024 at 10:04:54AM +0000, Liuye wrote:
>> >> >On Tue, Mar 12, 2024 at 08:37:11AM +0000, Liuye wrote:
>> >> >> I know that you said schedule_work is not NMI save, which is the 
>> >> >> first issue. Perhaps it can be fixed using irq_work_queue. But 
>> >> >> even if irq_work_queue is used to implement it, there will still 
>> >> >> be a deadlock problem because slave cpu1 still has not released 
>> >> >> the running queue lock of master CPU0.
>> >> >
>> >> >This doesn't sound right to me. Why do you think CPU1 won't 
>> >> >release the run queue lock?
>> >>
>> >> In this example, CPU1 is waiting for CPU0 to release 
>> >> dbg_slave_lock.
>> >
>> >That shouldn't be a problem. CPU0 will have released that lock by the 
>> >time the irq work is dispatched.
>>
>> Release dbg_slave_lock in CPU0. Before that, shcedule_work needs to be 
>> handled, and we are back to the previous issue.
>
>Sorry but I still don't understand what problem you think can happen here. What is wrong with calling schedule_work() from the IRQ work handler?
>
>Both irq_work_queue() and schedule_work() are calls to queue deferred work. It does not matter when the work is queued (providing we are lock safe). What matters is when the work is actually executed.
>
>Please can you describe the problem you think exists based on when the work is executed.

CPU0 enters the KDB process when processing serial port interrupts and triggers an IPI (NMI) to other CPUs. 
After entering a stable state, CPU0 is in interrupt context, while other CPUs are in NMI context. 
Before other CPUs enter NMI context, there is a chance to obtain the running queue of CPU0. 
At this time, when CPU0 is processing kgdboc_restore_input, calling schedule_work, need_more_worker here determines the chance to wake up processes on system_wq. 
This will cause CPU0 to acquire the running queue lock of this core, which is held by other CPUs. 
but other CPUs are still in NMI context and have not exited because waiting for CPU0 to release the dbg_slave_lock after schedule_work.

After thinking about it, the problem is not whether schedule_work is NMI safe, but that processes on system_wq should not be awakened immediately when schedule_work is called. 
I replaced schedule_work with schedule_delayed_work, and this solved my problem.

The new patch is as follows:

Index: drivers/tty/serial/kgdboc.c
===================================================================
--- drivers/tty/serial/kgdboc.c (revision 57862)
+++ drivers/tty/serial/kgdboc.c (working copy)
@@ -92,12 +92,12 @@
        mutex_unlock(&kgdboc_reset_mutex);
 }

-static DECLARE_WORK(kgdboc_restore_input_work, kgdboc_restore_input_helper);
+static DECLARE_DELAYED_WORK(kgdboc_restore_input_work, kgdboc_restore_input_helper);

 static void kgdboc_restore_input(void)
 {
        if (likely(system_state == SYSTEM_RUNNING))
-               schedule_work(&kgdboc_restore_input_work);
+               schedule_delayed_work(&kgdboc_restore_input_work,2*HZ);
 }

 static int kgdboc_register_kbd(char **cptr)
@@ -128,7 +128,7 @@
                        i--;
                }
        }
-       flush_work(&kgdboc_restore_input_work);
+       flush_delayed_work(&kgdboc_restore_input_work);
 }
 #else /* ! CONFIG_KDB_KEYBOARD */
 #define kgdboc_register_kbd(x) 0

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
