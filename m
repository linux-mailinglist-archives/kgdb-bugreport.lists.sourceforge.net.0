Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E91D4B12
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 May 2020 12:33:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZXea-0002Bk-3C
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 May 2020 10:33:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky@gmail.com>) id 1jZXeY-0002Bd-Lr
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 10:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+XVj7Vn4q7UWK0rXA2mfb7XaH4le6Oj5JDX0rkTcjv8=; b=nAn/est5TCT7UZijBvBDQ5dy4y
 vPj5xvuMjRWNaxcUiGWHyRjBcE/u/8sP+Rk9VTfLI1VSp9eHo470hUyIBTcAuyq+II6q1nuSbSYp1
 S4jn9aYxMt4R+uxFFfdDl39RBbUJCfMHCnk5GwkVQSes4bs9DCVrG+ffEzvTE1dkyDOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+XVj7Vn4q7UWK0rXA2mfb7XaH4le6Oj5JDX0rkTcjv8=; b=CcoIdR1qdNV6HVJ2Hi0cbAzLem
 2RGUzPhb7T6raVPB93RIIK0OfjAwDRkDvAWzTXhCRIOQNGkbVYca8XHeq8kWniFSyH5/Gd8AHUKk4
 Ny0SWcHqbhRQQxr+HDZiNUjzZ4mHQ9DRv385psCMpDl06mYe5J8ORpnqLOwW4+JlaZK0=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZXeX-00BUL3-Fy
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 10:33:18 +0000
Received: by mail-pl1-f196.google.com with SMTP id k19so733964pll.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 May 2020 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+XVj7Vn4q7UWK0rXA2mfb7XaH4le6Oj5JDX0rkTcjv8=;
 b=QQepBCDYSozWfCOr/eFEkoIrW01LVBw3ONlO+lac/N4lGJUp/URE0OM0R9XXbLQIJ3
 YYf2/4K2rm8OLRPVubTJZFyO50CLzcAWr8nckIRaOLY+1f/vjSs2lR+Y5Y9bYDVQr+pO
 Fnas1I2V70MShXTLQFzApJ2ybjosMrusIzmosj5ERNkD0FNvl2r7xEpN3u7aiDcdK0tr
 JLoFrbFbEqVnmjAqh84lWcO60Bmd564ZmkSBEo0e8Y39SfjqK2Z8OgAUv8FeW0UIIq7Y
 6HRB59wBCV00RZ4X9L92ig7LTwJGuZxKJZFNvgtQjZp6S88j5dMkuyDY9bSxQbZ/13/F
 /JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+XVj7Vn4q7UWK0rXA2mfb7XaH4le6Oj5JDX0rkTcjv8=;
 b=iu875n1qcwjbPf+26E8oMKjLlmo0KPXZnX6MdAF9fTxRSsV6sCBQHwlzaLxdcpKdnW
 PIhBovQiBOzNWx5g8mgD7xUHSgxVl5rtEqm2ovoGZkcrxNWQ7AYW1a7BRcltNux/Mg8f
 9xCqp3XkBsWwJYquDg5fZdM8JfzZ++fMAc+cTG+n99UEJrJYk4pZdQC+8YmmXHQ2W0qV
 Ea/FXSRo7hJIfNwk8TazNsdJfT+qoSm8k1XNeTOMODVYCktbmyVqKs2tUVQjn/QIxcm7
 YgM6uO8RvlXgtSUqgIVN1AxhIEkxHLMZwbFxi8qzXlk8NQrrOphUlMeBM2yH8I1zWnlF
 EUzQ==
X-Gm-Message-State: AOAM531w4vzjyRXMQgQyrKhwwTDnbGe5MyeWNye5gjgr3gvNeAs6qk/N
 yJYLP9CCXlJ4Vk7B7ZBj180=
X-Google-Smtp-Source: ABdhPJweTKamypY9HN33QeOPRzMIehLxFsMWkxcut7xNXPUoTEgrKmllHE13oLf4hSc73mfTruAatA==
X-Received: by 2002:a17:90a:1aa2:: with SMTP id
 p31mr2625068pjp.233.1589538791105; 
 Fri, 15 May 2020 03:33:11 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id j23sm1316378pjz.13.2020.05.15.03.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 03:33:10 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 15 May 2020 19:33:08 +0900
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20200515103308.GD42471@jagdpanzerIV.localdomain>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515085021.GS17734@linux-b0ei>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZXeX-00BUL3-Fy
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
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

On (20/05/15 10:50), Petr Mladek wrote:
> kdb is able to stop kernel even in NMI context where printk() is redirected
> to the printk_safe() lockless variant. Move the check and redirect to kdb
> even in this case.

Can I please have some context what problem does this solve?
I can see that vkdb_printf() calls into console drivers:

	for_each_console(c) {
		c->write(c, cp, retlen - (cp - kdb_buffer));
		touch_nmi_watchdog();
	}

Is this guaranteed that we never execute this path from NMI?
If so, can this please be added to the commit message? A more
detailed commit message will help a lot.

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
