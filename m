Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F102428B3
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 12 Aug 2020 13:33:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5p0K-0004LC-6d
	for lists+kgdb-bugreport@lfdr.de; Wed, 12 Aug 2020 11:33:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <allen.lkml@gmail.com>) id 1k5p0I-0004Ks-3t
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 11:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Em9Sp8XmzIpv/p2/XIEVSGX1+QelGDXMy8mBEoKzQGA=; b=lF57H2vN7AFnsi8xl+lhsl0Cbd
 53jDE8GevgNAgyFU2nSYTutjrYlmrHca/8D+HOxDd9TrnJLcXNMAsZxIg/qkCi8K79u4VWkKhSzRR
 ZpcJ328M2hWVt+pc0CkSYBGenNQFJRyV2GTDBbmdObi3/EUEH5+TfoZAcsfO3A2XvCv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Em9Sp8XmzIpv/p2/XIEVSGX1+QelGDXMy8mBEoKzQGA=; b=aFGCL4/5pKqTkPs4vyFt3lgJ1e
 8+yFd1kTybfFRQ5qQkiTtKKHUmeXT9ITGTyrGTe6TkJYGtANK85H6LQK8M4+FTu++pwnA+gGhHJYP
 ePg1I1sK+GD8mtXZq6GfYIpe1GgwVleqw+1KsiaOt/TxOZMZuVK6PmlBTz2uf5qXq4UU=;
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5p0G-00AeZE-E4
 for kgdb-bugreport@lists.sourceforge.net; Wed, 12 Aug 2020 11:33:10 +0000
Received: by mail-ot1-f67.google.com with SMTP id v6so1593224ota.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 12 Aug 2020 04:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Em9Sp8XmzIpv/p2/XIEVSGX1+QelGDXMy8mBEoKzQGA=;
 b=svUM0PtlSc/BsJ398hEypGo/dtDceKxpkxJL2XapJiufbso1e8LfFI4bXYobnoySJa
 SRjvv9f/48b5GJPA7fHwECXPGN7eO/ub5qQngsk3EUO83vMzAXxkqcbbp5j1xemvZIq9
 s5mftpWisvt6SbOmNG3lr1AFiu06MFhrdLN47I42cpfWHFnGFPC0kmoM7pnxUZpSyLQj
 +N4Js6sN6aumylIuGGMt2QsXP+hkf1Ol4GBV8Uuo8S00kvpt2DD1ugHsd9sXoZ13vg/2
 3wLqiAgbMsq3tbjK6M6brM8AX2Uig0dYIzJF4KNHkRmKijkDxBWgQ34F0o2mtUai8o4g
 hCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Em9Sp8XmzIpv/p2/XIEVSGX1+QelGDXMy8mBEoKzQGA=;
 b=fhx10vG43yjEO8S8S5bu40rblgH1TMgkTJlklIC2k0Ps1XLH2ChH5gHvr5Ooq/nW44
 +GgXC9kuq46KF+I3QuFMbAWTQjOdQ0DSEbBLrIFnMsWh47hTo7BWOsO+QS7Zugdh/W0U
 H/3DYTQZoqk6TZXD9rwRurUO8psPLC7Y5VtS5d/LjWY8o6hozB29WO4/ACe0A7pWoBD9
 ORbfm/sg89w7d6r1MvOQlwugJotRShE5SdFMTJQiQkhmC4ZBmV5ZY0qTcUgpsXJItJRR
 K9jdk9K+W11wptYeJCSAyb4xrUR+sGasLauUQ5NnkqwNq2Mxi+XmqT2lqvolyzNCLi9B
 hzAQ==
X-Gm-Message-State: AOAM531aUQUcHHZMIYg/dzi43L58DstBoHoS1QA5g8mlYyQq7+7qN/Up
 uG5AJn0sb9zBIlEyWNfz7xQThEZYpiN4nU5sL0s=
X-Google-Smtp-Source: ABdhPJyApW1cAsqfCZE8viTLCHhX3eA/ksSTGjILeL6+zxKJ5TOuIeeZt8iyPAiUApQEScansB5N2ki5ANp9kIXSCiU=
X-Received: by 2002:a9d:128c:: with SMTP id g12mr8585420otg.242.1597231982871; 
 Wed, 12 Aug 2020 04:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200716030847.1564131-1-keescook@chromium.org>
 <87h7tpa3hg.fsf@nanos.tec.linutronix.de> <202007301113.45D24C9D@keescook>
 <CAOMdWSJQKHAWY1P297b9koOLd8sVtezEYEyWGtymN1YeY27M6A@mail.gmail.com>
 <202008111427.D00FCCF@keescook> <s5hpn7wz8o6.wl-tiwai@suse.de>
In-Reply-To: <s5hpn7wz8o6.wl-tiwai@suse.de>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 12 Aug 2020 17:02:50 +0530
Message-ID: <CAOMdWS+FJm0NZfbj+yyShX2edX6_9w5K+rA+_u+Z6-rrjcwucg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.67 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (allen.lkml[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.67 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k5p0G-00AeZE-E4
Subject: Re: [Kgdb-bugreport] [PATCH 0/3] Modernize tasklet callback API
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
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 alsa-devel@alsa-project.org, Oscar Carter <oscar.carter@gmx.com>,
 Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Romain Perier <romain.perier@gmail.com>, linux-input@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

>
> I have a patch set to convert the remaining tasklet usage in sound
> drivers to either the threaded IRQ or the work, but it wasn't
> submitted / merged for 5.8 due to the obvious conflict with your API
> changes.
> Each conversion is rather simple, but it's always a question of the
> nature of each tasklet usage which alternative is the best fit.
>
> FWIW, the current version is found in test/kill-tasklet branch of
> sound git tree
>   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git

Great. Currently my tree has these converted to use the new
tasklet_setup() api. I will add these to my threaded IRQ/work tree
(which is still wip).

Thanks.


-- 
       - Allen


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
