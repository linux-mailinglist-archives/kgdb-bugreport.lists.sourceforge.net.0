Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 972FE60BFB8
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 02:37:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1on7wq-0006Zl-Cr
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 00:37:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1on7wn-0006Zb-Qq
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fPe/RMLbUY4CuSM7GCQGLirlVS+xcFvAA0teuuPRF5Q=; b=SlEm0GlNSKVQ+0pcnD5rL+LWjN
 Y2RxzTi+pEdHLNfG7Z3GeyVPbNKHK5wYYSypoGwVzZ98vg2u9syiXu/MWUhc2Gd7ZVvro82hBbaGN
 2tRfBGejI1PROHw1n5trYXLWqjznwX6LbJ7kIHvVzvjv1HVvx0vh8BForxdkUqGDW+cY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fPe/RMLbUY4CuSM7GCQGLirlVS+xcFvAA0teuuPRF5Q=; b=STGSJrfNMIblMDtRNF55XZ0JSy
 00l1WzEmC/H52iHev+HBsGAn0tLe71P6faqg95HGwgLB/UBequvjeMoC1dVb5SiF96d1POxpd5gfG
 E5/zUr7Xp3+KlHKgxJYB9bvivRKl/10MjbzX2AqKB7/6gv5z96mCeXMBt5U58NhIRv8M=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on7wW-0003Ra-DM for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:37:32 +0000
Received: by mail-ej1-f44.google.com with SMTP id b2so8816527eja.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fPe/RMLbUY4CuSM7GCQGLirlVS+xcFvAA0teuuPRF5Q=;
 b=OyZEHkKgw9pJonxe/apcVlx8t/OatQWcG++lFP2RH/sgR7udHA3ave3qg6yhSyv8ts
 9P8tWQVY3ZO99ez5CIYNXXDcSjK4+nWK+99p8jGTGisyAe1UeAfrqntujEiWBP+HSzUR
 mUl37+uoGw+MhlNyTQ55QbmuDGjT/rVhABIkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fPe/RMLbUY4CuSM7GCQGLirlVS+xcFvAA0teuuPRF5Q=;
 b=p6pksMtDg+loIhfp4QQ0eSCKtVoRtAtuJ7c8iFP6RUk3RAwF/kBQl5UrEipy6D5IX+
 miOY/JgRqqPNgg+ESqv/eM7O3s7YCYaKoPfpvL6XCnU4DSv4wz54aX+ugHlib2os6ksj
 1Fj4jbGm4J1i8EmKbQmK2FnKTo/di9JF8OoUgO5WrUBqz/tH2jZqYEMNytwj3drn/LRt
 OlVwE1ty83j2Am8ZUXcyypBomYrcgysumlv+2Yo/yDnIY+UVp9+rdRz93WZmG3ZqxndY
 cYkSVpNl+9FLgYZ+swavAX9sqpOwQYlo+rUEOTLwCth9Abf+nZurFzChHeRM9rl60KnE
 G9ZA==
X-Gm-Message-State: ACrzQf0KKDTfrru6IkW2j5qcqZan+5OGKx+0XYwHHUIfJYN2RPrvW8dl
 yf+Rpp6boFuxIu3ZTq4EVfl8EWMXONbDteOY
X-Google-Smtp-Source: AMsMyM4oSBRphQ7NB1KG6dNWBarMBmEoFv67K0k4lyLeIeMEYiguK160NsNb75O4jdoVY5ia4EX/qQ==
X-Received: by 2002:a17:907:7d8e:b0:78d:ed30:643b with SMTP id
 oz14-20020a1709077d8e00b0078ded30643bmr29414804ejc.253.1666658233776; 
 Mon, 24 Oct 2022 17:37:13 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 b1-20020a1709063ca100b007030c97ae62sm525787ejh.191.2022.10.24.17.37.11
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 17:37:12 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id bk15so18458635wrb.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:37:11 -0700 (PDT)
X-Received: by 2002:adf:f641:0:b0:236:737f:8e00 with SMTP id
 x1-20020adff641000000b00236737f8e00mr4375266wrp.659.1666658231649; Mon, 24
 Oct 2022 17:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-23-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-23-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Oct 2022 17:36:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYa2SEFkARyHqJFLt4vBfC9zzdnRZeaXGoa-aGtPVRiQ@mail.gmail.com>
Message-ID: <CAD=FV=WYa2SEFkARyHqJFLt4vBfC9zzdnRZeaXGoa-aGtPVRiQ@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Oct 19,
 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > kgdboc_earlycon_init() uses the console_lock to ensure that no
 consoles > are unregistered until the kgdboc_earlycon [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on7wW-0003Ra-DM
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 22/38] serial: kgdboc:
 document console_lock usage
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Oct 19, 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de> wrote:
>
> kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
> are unregistered until the kgdboc_earlycon is setup. This is necessary
> because the trapping of the exit() callback assumes that the exit()
> callback is not called before the trap is setup.
>
> Explicitly document this non-typical console_lock usage.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  drivers/tty/serial/kgdboc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
