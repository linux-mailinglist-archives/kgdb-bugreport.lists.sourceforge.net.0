Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA31D5633
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 May 2020 18:36:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZdKN-0000O6-4j
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 May 2020 16:36:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky@gmail.com>) id 1jZdKM-0000Ny-02
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bh8ixcsDUuAv48rLKduFHjKYM7D8+5KBZ3dzDMIQTNo=; b=Uh09W2E1Q/u+1EgBL5nwGrobl4
 HzCPWdH+zV06UkpC7X/tCbLG9La1m39zLbEcH7Im9EDyQMeBzEORTxW1LjcUgNboOOoSbr/2I8OVi
 +ITZkXUQPxdW+QYbIQKGl/hAdUwnzjgZ8xcRnMH1KG6Jvhr9KzRGtGg0yPVm4kMpAbCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bh8ixcsDUuAv48rLKduFHjKYM7D8+5KBZ3dzDMIQTNo=; b=STxfz3cBJ+fdp3LBlLLQbX1oH7
 PoYuv9XMhTqLMREK86H+Uj5C52mR8R3Wz7F2prNTEN3ygPoIxUZ54V63Zxsm5ODZTdcRerQi4oDfa
 ETzWEqM1OGQBZ6bdRZrowaXMg7OS/LRjFKGM8vWLyQ6AD5xAHeWDJe8/oul91X1EQbI0=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZdKI-00BooK-Dh
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:36:49 +0000
Received: by mail-pf1-f195.google.com with SMTP id x15so1193299pfa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 May 2020 09:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bh8ixcsDUuAv48rLKduFHjKYM7D8+5KBZ3dzDMIQTNo=;
 b=ZhAOfp+UMX7lLYJr0/PzKOR6v3qyxcZXl6kAhItI0c2DozwmG3GHhsAqobF3tB1Jvd
 J9KilAgtSIXAm4tsiWHhTQAd49AVoLwHeU0onuhtROXUoKNksqRkcWoiDMcSwMu7ECY6
 slkOEZDJPkv89qedsX589SJUcHR0iwluBOh68DJUz591pQWXlJDhv0YuPMjrMsH4IzOb
 A9Tjb+tkJUovBT14Jg6IR2YvPBvJ4qX23PG2Mqkh56Ql6OCE0uYq2OD8sqw37IY97Gw0
 b4ZvA6YJfE2uVIADBY8mrnPQDDImVu2JeTffLG/JLbox29tZsIqWAO9YD9YLFVFmipUQ
 SGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bh8ixcsDUuAv48rLKduFHjKYM7D8+5KBZ3dzDMIQTNo=;
 b=HPUQVKLqlndFtqhJ29a1GUOn7q90vV3Pc5CpfFqWNLDgBldIIvyz/4+RqufRB0iGy/
 l/iSOWBMXk8V9Emeyl8NUiZ7sqZ0b95yYCHJnNV6aGTh0h7rCc94ZyqOr6szVY7yBtZb
 kQiNsaQG04FGcnuJGYSYzpcP5ylZyy+aUvh8G15fZhXpIAk6smnqTt5HgR92YpV1vYBZ
 FRtBOeEed1kAdB6LkQk4CiXI038brKvLiWQUhhq1k5LkDXW1T2zuEa1x299n/SwyPaiw
 Mu1NiMO9xSbL89WSFqxv7Pko1xLHmlgDGcBuk6TZyGAy3CX8ksDeNeQOfaliyhQREfg0
 tx+Q==
X-Gm-Message-State: AOAM530IBlN8q+zNYaY2XU3SiwGwwyYeC2eGbI9JpscZDMmdJVufmEJf
 OPqked2aiL+zye2rrrrimV4=
X-Google-Smtp-Source: ABdhPJwzdar/iwUxzCQU7H1yQOkxLGAdRa+i9xU4TgPUhSS8+Y06un4TwoVVGYWcRVTsTSJlSN0p4Q==
X-Received: by 2002:a65:6799:: with SMTP id e25mr4100089pgr.9.1589560600837;
 Fri, 15 May 2020 09:36:40 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id kr1sm1882333pjb.26.2020.05.15.09.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 09:36:40 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Sat, 16 May 2020 01:36:38 +0900
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200515163638.GI42471@jagdpanzerIV.localdomain>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <CAFA6WYOBsimP1j8Fwq4OcePEug4MGoaY3wTTTVydHtTphZ-FTw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYOBsimP1j8Fwq4OcePEug4MGoaY3wTTTVydHtTphZ-FTw@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZdKI-00BooK-Dh
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (20/05/15 17:32), Sumit Garg wrote:
> > Can I please have some context what problem does this solve?
> 
> You can find the problem description here [1] which leads to this fix.

[..]

> [1] https://lkml.org/lkml/2020/5/12/213

Thanks for the link. I'm slightly surprised it took so many years
to notice the addition of printk_nmi/printk_safe :)

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
