Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD95887BDC3
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 Mar 2024 14:33:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rklDB-0001gN-5f
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 14 Mar 2024 13:33:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rklD9-0001gF-IV
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Mar 2024 13:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QpHqE4qRwayb9ewqa6TQgGRa9Y2eMKjnSCgSywsCAts=; b=Pq1bqKxolf3bh/1w5GrcRH24F1
 7zkualyKa/t0DfPy7Z/QFCUmFCx8R3PTfBLE8+e/zOYx6jR2AbN22siK1SWOJ63/kD7yq+xRHSw3L
 l+Oiow/ezqAjwsg6fupewN41HlmSg2JRHpWoZ75hPQj1oa7AebKOiTveBGkLHWzoi+hA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QpHqE4qRwayb9ewqa6TQgGRa9Y2eMKjnSCgSywsCAts=; b=m7CCsqHQdGZ2/h7CMEIWyqjdoi
 UkZraO/zngSrbrzLTOR6KJpzCWG0Sq4eaeO9cYV6kbimUz+DVPHwWELmgDVkjVWTBQuACmQx6jNqg
 98iJEzXYRF55hw9wu58HvOTWJ7rvgPPoNoGj0Uj49jrdexpNyNIHeyNzwGOmym0IOji8=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rklCz-0007si-BO for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Mar 2024 13:33:31 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d46c44dcc0so12287601fa.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 Mar 2024 06:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710423196; x=1711027996; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QpHqE4qRwayb9ewqa6TQgGRa9Y2eMKjnSCgSywsCAts=;
 b=VWckV12JH0mId5RoXedxV+C3hRllm/UA/5OC8+eEF++FBMGI2AcH+J/GrgQLkdMMMV
 OPD3CvkblD59aXPrYaAkJhRKyfhihaG8gIxDvhetgBUa/iasEEIFW5EeN7gZbbvAS3Vr
 FWkhFKk/hPJTZQiWWT9Z+v2sLqp1r/OsMjNPUarY3Rnpg1Qf9NOnFOC+WA1nDVva1Y7F
 1EWlnIvJjBbhQgRvmA9y0waACLpBtn+sD/qIRxOYwo6fAN4G37ibPqcPpNyovQqMNYiI
 r3qO+/0JfEIxV/cq6Vu5IO1vLydemkFNRS9QkjAvQ2P5Q1x3LSz1JHwfQ+NsgRqWYTM3
 F0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710423196; x=1711027996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QpHqE4qRwayb9ewqa6TQgGRa9Y2eMKjnSCgSywsCAts=;
 b=di66Z1MN6tRdJsk7TyJwt4+xVDfgpvKTvqhARCQNDAQcMV3LqZrn0ery0Pjd9nRDUj
 P5Du429e0fqMkeL7R7kS9hsyqW4OHG6kMd+A0spI/wVBQwXWvTwEBd0GEsmdESpk51ql
 6gnsIzQGz1Nd7PhSmr6vNOWX1ubpnNp97WO9pYqLeixUg5M8MCwgDtCNPUoDSJ6ENO+R
 m/nhUigv33oXznfHC/OnCes9Gf+Rk51djQ63Kfm8MAI+ek5anmQOJ66Q/ekAPo52oQyb
 AaRS1Bo5Wp58L65j5VsqTgCk8QD68MnYSdctpDiR8j0FQxk8uZ8O069vrEwyAlnmDOSE
 MuLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC5qcvEWaviqEmMHKuPNsZTpBGrurgzT52m+ize4c8EVQELXoqZlknjPeral3PBzjz1qM7tH5L7cvul8Ebxx7zBZ03DqwNvokAu4oZLSoZKFRNJT4=
X-Gm-Message-State: AOJu0YwcmuhVk7OEXkR/XcOqHdwHYedTPMK8vWsZKzUDWWJRLE7GeFhn
 UOg68Qj9gyJt7WXp09WgcsiMHr4gldaKR9HjLQ3sJwC31WNA1yOaMDFdS5OHcnvytXxG1T82uxx
 Wpv4=
X-Google-Smtp-Source: AGHT+IHTa22l22nIxzhaVXMXhuyWIdndVhvd/KaEs8lLcbXOoyKU9c+RTspxjUWimBMIyTf9Pao1dg==
X-Received: by 2002:a05:600c:190d:b0:413:260e:22af with SMTP id
 j13-20020a05600c190d00b00413260e22afmr1143889wmq.19.1710421758959; 
 Thu, 14 Mar 2024 06:09:18 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c138900b00412f2136793sm5587778wmf.44.2024.03.14.06.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 06:09:18 -0700 (PDT)
Date: Thu, 14 Mar 2024 13:09:16 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <20240314130916.GE202685@aspen.lan>
References: <20240228120516.GA22898@aspen.lan>
 <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
 <20240301105931.GB5795@aspen.lan>
 <2ea381e7407a49aaa0b08fa7d4ff62d3@h3c.com>
 <20240312095756.GB202685@aspen.lan>
 <06cfa3459ed848cf8f228997b983cf53@h3c.com>
 <20240312102419.GC202685@aspen.lan>
 <410a443612e8441cb729c640a0d606c6@h3c.com>
 <20240313141745.GD202685@aspen.lan>
 <56ed54fd241c462189d2d030ad51eac6@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56ed54fd241c462189d2d030ad51eac6@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 14, 2024 at 07:06:22AM +0000, Liuye wrote: > >On
 Wed, Mar 13, 2024 at 01:22:17AM +0000, Liuye wrote: > >> >On Tue, Mar 12,
 2024 at 10:04:54AM +0000, Liuye wrote: > >> >> >On Tue, Mar 12, 2 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.170 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rklCz-0007si-BO
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiDnrZTlpI06IOetlOWkjTog562U?=
 =?utf-8?b?5aSNOiDnrZTlpI06IFtQQVRDSF0ga2RiOiBGaXggdGhlIGRlYWRsb2NrIGlz?=
 =?utf-8?q?sue_in_KDB_debugging=2E?=
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

On Thu, Mar 14, 2024 at 07:06:22AM +0000, Liuye wrote:
> >On Wed, Mar 13, 2024 at 01:22:17AM +0000, Liuye wrote:
> >> >On Tue, Mar 12, 2024 at 10:04:54AM +0000, Liuye wrote:
> >> >> >On Tue, Mar 12, 2024 at 08:37:11AM +0000, Liuye wrote:
> >> >> >> I know that you said schedule_work is not NMI save, which is
> >> >> >> the first issue. Perhaps it can be fixed using
> >> >> >> irq_work_queue. But even if irq_work_queue is used to
> >> >> >> implement it, there will still be a deadlock problem because
> >> >> >> slave cpu1 still has not released the running queue lock of
> >> >> >> master CPU0.
> >> >> >
> >> >> >This doesn't sound right to me. Why do you think CPU1 won't
> >> >> >release the run queue lock?
> >> >>
> >> >> In this example, CPU1 is waiting for CPU0 to release
> >> >> dbg_slave_lock.
> >> >
> >> >That shouldn't be a problem. CPU0 will have released that lock by
> >> >the time the irq work is dispatched.
> >>
> >> Release dbg_slave_lock in CPU0. Before that, shcedule_work needs to
> >> be handled, and we are back to the previous issue.
> >
> > Sorry but I still don't understand what problem you think can happen
> > here. What is wrong with calling schedule_work() from the IRQ work
> > handler?
> >
> > Both irq_work_queue() and schedule_work() are calls to queue deferred
> > work. It does not matter when the work is queued (providing we are
> > lock safe). What matters is when the work is actually executed.
> >
> > Please can you describe the problem you think exists based on when
> > the work is executed.
>
> CPU0 enters the KDB process when processing serial port interrupts and
> triggers an IPI (NMI) to other CPUs.  After entering a stable state,
> CPU0 is in interrupt context, while other CPUs are in NMI context.
> Before other CPUs enter NMI context, there is a chance to obtain the
> running queue of CPU0.

Focusing on the run queue locks in this analysis is a mistake. Before
the other CPUs enter NMI context there is a chance for them to obtain
*any* locks, including the timer wheel locks.


> At this time, when CPU0 is processing kgdboc_restore_input, calling
> schedule_work, need_more_worker here determines the chance to wake up
> processes on system_wq.
>
> This will cause CPU0 to acquire the running queue lock of this core,
> which is held by other CPUs.  but other CPUs are still in NMI context
> and have not exited because waiting for CPU0 to release the
> dbg_slave_lock after schedule_work.
>
> After thinking about it, the problem is not whether schedule_work is
> NMI safe, but that processes on system_wq should not be awakened
> immediately when schedule_work is called.

I disagree with this conclusion.

The problem *is* that schedue_work() is not NMI-safe.

You cannot solve an NMI safety problem by replacing schedule_work()
with another function that is also not NMI-safe. That simply changes
the locks that need to be taken to provoke a deadlock.


> I replaced schedule_work with schedule_delayed_work, and this solved
> my problem.

This may stop some specific reproduction from taking place but it
does not fix the potential deadlock.

I still believe that using irq_work is the only way to solve this
properly. Please try the following change:

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 7ce7bb1640054..161b25ecc5e15 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/irq_work.h>

 #define MAX_CONFIG_LEN		40

@@ -99,10 +100,17 @@ static void kgdboc_restore_input_helper(struct work_struct *dummy)

 static DECLARE_WORK(kgdboc_restore_input_work, kgdboc_restore_input_helper);

+static void kgdboc_queue_restore_input_helper(struct irq_work *unused)
+{
+	schedule_work(&kgdboc_restore_input_work);
+}
+
+static DEFINE_IRQ_WORK(kgdboc_restore_input_irq_work, kgdboc_queue_restore_input_helper);
+
 static void kgdboc_restore_input(void)
 {
 	if (likely(system_state == SYSTEM_RUNNING))
-		schedule_work(&kgdboc_restore_input_work);
+		irq_work_queue(&kgdboc_restore_input_irq_work);
 }

 static int kgdboc_register_kbd(char **cptr)
@@ -133,6 +141,7 @@ static void kgdboc_unregister_kbd(void)
 			i--;
 		}
 	}
+	irq_work_sync(&kgdboc_restore_input_irq_work);
 	flush_work(&kgdboc_restore_input_work);
 }
 #else /* ! CONFIG_KDB_KEYBOARD */


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
