Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF21F6244
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 Jun 2020 09:27:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jjHcr-0004cF-Hp
	for lists+kgdb-bugreport@lfdr.de; Thu, 11 Jun 2020 07:27:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky@gmail.com>) id 1jjHck-0004by-82
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 07:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F9YRyl1QH8nNLxQb6YLXx+y0EshlCzJxB+jfKLjlAqM=; b=cvfGBp3JpuF1YdAS/vtU8OlkWs
 H+KViB0N1kJvmZC3RX3MaxuJvJ0FQInN4uTuJrv9x2BNCoCvncUrr3IYV4UTKyGhpgxpI9mhr+6A9
 ZM0G+xEZvQTptYNp1OeECmIgCjD3JEHnKGPLZn7KHsQ/4iIIGmR5IqC7GrAFmevXciFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F9YRyl1QH8nNLxQb6YLXx+y0EshlCzJxB+jfKLjlAqM=; b=NEE0oVAKZ2C2IdRsrQ0BKXM78/
 C+aLnqFcvUlQ56Jk1wqoCT0ocY+PLKqCpeEEXLal/hB+WGg4LJ90aOaU9AtRvK542jVvnLAcv3mGk
 CBIQArAgApWgg357yr82vjIKvWukwYzU0tc44wiiLKKpIYd9fJV8tvWq56R5dKsVxW04=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjHcj-00F6AZ-25
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 07:27:42 +0000
Received: by mail-pf1-f194.google.com with SMTP id b201so2315244pfb.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 11 Jun 2020 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F9YRyl1QH8nNLxQb6YLXx+y0EshlCzJxB+jfKLjlAqM=;
 b=TxQNPxCdxCFIlxp1IRQ0D8Vg8XFC00Bg44uvyzsUqyx/qoeEbJWb3Mnt5q6gUimqT7
 T25vKLwTHkwlPT/ja4Cfdhlny+1HZBqfBwTnX1lgltBfscYNxT8xBAX2YQAgzwhDEa60
 GdfWj4jhMDxUKdQMlK62NwFZ0n6OlvWmEkeHonIv3Qq3NZOe2gkw38y8cEhu69qalJjl
 FGq2+yPg3xe7Wh47U9W/R8HuIlY6E2ELpAezBXHuvX4HVM1Adz+bBpEIBBHizDPmDExV
 Wi/JAI/TmK9L5DuunYFH56e6fG3wJEPkeC68iUkcKc7s3+m5RCT0RrILg4QdEEysMndO
 8qpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F9YRyl1QH8nNLxQb6YLXx+y0EshlCzJxB+jfKLjlAqM=;
 b=dKcksJP9WngKrS8r+/XbnGRd/w1gyPl8a824ar0TBBUMhbd5C6a520s0IlDgLuz+2F
 P9HM/lwCGBH0F1/RAVdDlTrS6QVd1teJ/NS9F0XtpZs82X5iwtzOkUEMlSRbwrys8qNA
 tZ2uYmWVqrQWOBURGiyAv3wDZEmt9yZIP8OeSrvP+qPqXxGHrwYnCwAF4LXgCdsR9vd3
 ZJ6QG0e/nC28FXgNVw9evxZNZn4Bwwr728mU6LjE6GY7OE8T4XTngHeKVjjIq82bTwCl
 jqyp7cUJAfrR4S15t3+NQLzKC2yQCf7dyKAnxxZXk+YjXsqwxTkNE7lEuS1ROVeIza9p
 C+Hw==
X-Gm-Message-State: AOAM530z4Y29VnDa5u2oJgj+jr/DaeORP2WmlmrAFRE8/z9DM/fMQbnn
 v31lKLzeCjnFq15IhiHwOxI=
X-Google-Smtp-Source: ABdhPJwhkrcAHfXYK9Qyr3n+8oV1pTLg7pFg4+NYq8gkVla26gxDRMXpFWipLKzcxbjwfYs46M449A==
X-Received: by 2002:a62:5ec2:: with SMTP id s185mr2426106pfb.0.1591860455453; 
 Thu, 11 Jun 2020 00:27:35 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id 15sm2152353pfw.189.2020.06.11.00.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 00:27:34 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Thu, 11 Jun 2020 16:27:32 +0900
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200611072732.GA429@jagdpanzerIV.localdomain>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <CAFA6WYOBsimP1j8Fwq4OcePEug4MGoaY3wTTTVydHtTphZ-FTw@mail.gmail.com>
 <20200515163638.GI42471@jagdpanzerIV.localdomain>
 <20200610164140.tgzcn5oip2gzgmze@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610164140.tgzcn5oip2gzgmze@holly.lan>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jjHcj-00F6AZ-25
Subject: Re: [Kgdb-bugreport] [PATCH] printk/kdb: Redirect printk messages
 into kdb in any context
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (20/06/10 17:41), Daniel Thompson wrote:
> > Thanks for the link. I'm slightly surprised it took so many years
> > to notice the addition of printk_nmi/printk_safe :)
> 
> Rather by coincidence (at least I think its a coincidence) the problem
> has recently become much more obvious.
> 
> 0d00449c7a28 ("x86: Replace ist_enter() with nmi_enter()") just brought
> this to the surface by treating debug traps as NMIs. This means the CPU
> that takes a breakpoint, and where almost all of the kdb printk() calls
> take place, will now unconditionally have printk() interception enabled.

Interesting. Feels like ist_enter() should have been using
printk_nmi_enter/exit() in the first place.

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
