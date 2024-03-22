Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 915408870D4
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Mar 2024 17:28:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rnhkT-0005s2-8s
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 22 Mar 2024 16:28:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rnhkR-0005ru-44
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 22 Mar 2024 16:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qwo8Q4aR89YXvBlc7dAQ6fc8n9z/Ax8Su/9Q4XHEyS0=; b=MZbBrCJzwx3t0xV18o+CytrfBe
 a+o2f6krFsOe0UMhV4LSL+igNZWAiNNjlMT//mUgVzA/wUSu12GNeeFDoR3cCK7sX+rd0SuQyNV05
 s61O9hRrY47BTyR9GWwa2cbpMtJpyMn8LBSBruYFGKxo+dRo7R5YsE38ove0UqP852Sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qwo8Q4aR89YXvBlc7dAQ6fc8n9z/Ax8Su/9Q4XHEyS0=; b=ME3Liho67wNwzj0WqXgw1BhXB4
 8bR82x6Jrp7JTW7eQam6N3R/aTtg7QBDqBn1a0UoWWpnzHR456Za2jAueQGNOYYJWwj5Q2jP1NsZv
 f5Jjz4J+DsXFvP32UQBimaDx7BdkfuyBh/o85v365Mo71jV5iqrsYAfyxCCTCi+1ys3A=;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rnhkP-0005F5-7n for kgdb-bugreport@lists.sourceforge.net;
 Fri, 22 Mar 2024 16:28:03 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4147f546947so979285e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Mar 2024 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711124870; x=1711729670; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qwo8Q4aR89YXvBlc7dAQ6fc8n9z/Ax8Su/9Q4XHEyS0=;
 b=otHcP82ENBdDWQQSy8Q7HUtzZnF2l5hPxsgGjBViFrs4U124iqbZDxCs4R30HTa1xM
 6BTYa/GGGwe3GxGWKbrzR2UbRT1l7/BBQIs4CxEpE9k4gmnJyO060Sev62WnAiYI1a1b
 xq1sHx5YhpaVq+xPfuREFPsePsctWWBdfmg+sXxU9jc78KmrdpB2vLXoZA5iH8D1S2B7
 h9qkXQ/a/cAk6gOl+9ERfbKpXA/Jn7LaMCM0WYnkVy1D0i2qjbmdxpusCOXLUOwHHPDR
 WqECoefa1l3IR3hbN5WrmyGL/ggixs+LDWgha1lIp0kTCgERUpCQuXC7ZejYTpKg72Mc
 oQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711124870; x=1711729670;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwo8Q4aR89YXvBlc7dAQ6fc8n9z/Ax8Su/9Q4XHEyS0=;
 b=nfqeyBvSktTF7Y4kJlD0dqnsdBbHDiA/8I93dO4K2MovzQPH1C7fczpTJ2YRCjT/pE
 doGYUQJxgMt/JoTXiHo3IhhK6NV+8glE3b7LwjMkGZ2/YEIbsb7S9BECHW5CYWQGBsel
 lUTetfsBrsMB7614JHhDP6zFL+L5TVWhHCkL1Skwd+69jr2Aeejer0YjFYSSFRgl+eKt
 NJGVAsmIftAUTzHxEN/sw52u+ZMMS8UN9ZqWzfJtiM9V2vJjf5vmb8G0TdcW0zfcYOlX
 olarb1LYIqk1alJ1FVs2rPmD1d3bQSPuyvLSDVFLwhU1oq5yf9EzW58k0vMc7OH1i9Q5
 sxVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+EtKxeizu85S0HYkr9ubER4RKPFktF49vdou5cKVkPnCZx4pngjULcKR8S5iq5SVki8yYUGUnPTb0aa4/38/r2oriFWM/I/+sEaANkIqGH8eNT7A=
X-Gm-Message-State: AOJu0YzG69jRFPeZUauNwn5Ab7foV27N3dZYswWqTCgn7+vn+rUMxRRx
 IRsoHF/2dyRAaqj5smtI0t31EIVxbJCVxfrqAVKtQA1DGIjNFOb+jkngWSttx8lkfAQMXwpnvHu
 rH0Y=
X-Google-Smtp-Source: AGHT+IFJFeVPNPMK0Uw9l4wNyOYo0A3jvYSJNtfO7Nj/LFMcd/gPOb4aK2tXb1HERCLuY33xfXf2gw==
X-Received: by 2002:a05:600c:3b90:b0:413:fa31:b9f6 with SMTP id
 n16-20020a05600c3b9000b00413fa31b9f6mr2140784wms.2.1711123101402; 
 Fri, 22 Mar 2024 08:58:21 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adfcd82000000b0033e7603987dsm2350941wrj.12.2024.03.22.08.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 08:58:20 -0700 (PDT)
Date: Fri, 22 Mar 2024 15:58:18 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <20240322155818.GD7342@aspen.lan>
References: <20240321110407.GB7342@aspen.lan>
 <20240321115017.2879691-1-liu.yec@h3c.com>
 <d3b77177-7c00-4459-9515-37afe741e9dd@kernel.org>
 <5649fa8bfbdb43ea914850794afc6cac@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5649fa8bfbdb43ea914850794afc6cac@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Mar 22, 2024 at 07:50:54AM +0000, Liuye wrote: > >On
 21. 03. 24, 12:50, liu.yec@h3c.com wrote: > >> From: LiuYe <liu.yeC@h3c.com>
 > >> > >> Currently, if CONFIG_KDB_KEYBOARD is enabled, then k [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rnhkP-0005F5-7n
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiBbUEFUQ0ggVjRdIGtkYjogRml4?=
 =?utf-8?q?_the_deadlock_issue_in_KDB_debugging=2E?=
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
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Mar 22, 2024 at 07:50:54AM +0000, Liuye wrote:
> >On 21. 03. 24, 12:50, liu.yec@h3c.com wrote:
> >> From: LiuYe <liu.yeC@h3c.com>
> >>
> >> Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will attempt
> >> to use schedule_work() to provoke a keyboard reset when transitioning
> >> out of the debugger and back to normal operation.
> >> This can cause deadlock because schedule_work() is not NMI-safe.
> >>
> >> The stack trace below shows an example of the problem. In this case
> >> the master cpu is not running from NMI but it has parked the slave
> >> CPUs using an NMI and the parked CPUs is holding spinlocks needed by
> >> schedule_work().
> >
> > I am missing here an explanation (perhaps because I cannot find any
> > docs for irq_work) why irq_work works in this case.
>
> Just need to postpone schedule_work to the slave CPU exiting the NMI
> context, and there will be no deadlock problem.  irq_work will only
> respond to handle schedule_work after master cpu exiting the current
> interrupt context.  When the master CPU exits the interrupt context,
> other CPUs will naturally exit the NMI context, so there will be no
> deadlock.
>
> > And why you need to schedule another work in the irq_work and not do
> > the job directly.
>
> In the function kgdboc_restore_input_helper , use mutex_lock for
> protection.

It is the call to input_register_handler() that forces us not to
do the work from irq_work's hardirq callback.

It is true that there are mutexes in kgdboc_restore_input_helper()
but if they were the only problem we could change the locking
strategy.


> The mutex lock cannot be used in interrupt context.  Guess
> that the process needs to run in the context of the process.
> Therefore, call schedule_work in irq_work. Keep the original flow
> unchanged.

You should answer these questions by posting a v5 with the explanation
in the patch description (otherwise the explanation of how the fix works
doesn't end up in the changelog).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
