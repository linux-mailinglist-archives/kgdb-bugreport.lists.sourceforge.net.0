Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BBE6225CD
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Nov 2022 09:49:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1osgmS-00056z-Jt
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 09 Nov 2022 08:49:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1osgmS-00056q-1z
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 08:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1aYtp8rKKFj6AMeEh8TgKPoMz3+QrQuPeMrc+lG2dC4=; b=EtzLuowpBhXiwzlhDFpFOGnFi7
 JtjGRD0+O6YS6B4Q3FlFgF+uQAqBs8/CiFGufODIAq+WJK8ismHk1wX6Z2LNEfB0ocsvlF9YbpcHY
 hYr7P7F+/zC4vDqNw0g+6Dj2y6guNfgqsnQD4wOLvm3PJdv9vw6zwAX4QfTJdMBxEJYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1aYtp8rKKFj6AMeEh8TgKPoMz3+QrQuPeMrc+lG2dC4=; b=nOkMCbMLy4Z6rkWy0ROZ38HZUR
 3TPUv8XTElSBAOWsOttHmKIL/LwfY2+2MLn1ClUrlByCUa3wrW0Mkh1EJ+IaC625C1qSqzReMPjTA
 uBKMz7GWmqurukP1jCk7rJugHqvDBGgAuPrjGEZfmJH2ZA/WOv0cxgn3OyzeMwa/dDSE=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1osgmN-001aSv-UP for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 08:49:55 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so774886wmb.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Nov 2022 00:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1aYtp8rKKFj6AMeEh8TgKPoMz3+QrQuPeMrc+lG2dC4=;
 b=CgVAeDwHGGqjX9pPwdf50j6laHJDZQEpjWOLA+xKGBUAg7h+8blHA3XYE+A4H6hy1I
 +1dKSYtKGZUuAl+U9Z0WfHgdyBZUvv9EzmvnG1ytRtExRhNWemLhbSmYN7VfeAGhepYx
 U7rN1/9hE5+K+sGZigDzLFL7ujbKcztqQxkyIAxYSeQCEq2CWvKXsIfVZ+dzQwytVxHm
 /enmgz1Fm6oegStPmknZqLuUrCtU4jyv1J+g+ubkBgU15W01xBdlc31YPr08Z+nBt3Mh
 umPmuVYBzhjNej5bjPy6kldig6wZnM02W4P2ZIMdQO5MXwK4fBQcYQSJ9CeltH8XObBN
 aWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1aYtp8rKKFj6AMeEh8TgKPoMz3+QrQuPeMrc+lG2dC4=;
 b=JZzH9zuYRTyLr7GbRUvJh3+TaIhR0iTXjNNOhMMH3gC77BsAqzwgtc3of4A2903f+Q
 DYnWPWZf0Xfw23+QGSig7HjFf02MKzg9ROaDCuofB6GVOonVgeW5W/9akUg4jSDN5a++
 wSbKh78V18dyYxjx6l8bco1/Ejw1L1ENeafeXKu/e+bqi7M0sZ2A7ZBVQdXkIHU3LTcb
 Wzs4JYGV6N4YxY05LtYQId10iXAbXqFWEhTrRzRXRr5NgReCFc5FkMXkq+5KM/TY2h06
 IaeDN07FZYAvd/8kd3HMb519tVK1BQ98oYUE4i62kS5slevPAw1h//UYu4YM60s4fCZb
 x9VA==
X-Gm-Message-State: ACrzQf0MTsMfwumxfgPR7Ld9eDi98t5OTTBoxpsQI7RgichcPVAZu7cU
 QuiyotVzDlYw1tonVrf8th7E4/FfJ0KsSQ==
X-Google-Smtp-Source: AMsMyM7BZMkF3omfYJ0Pcs634CeYkMyiilQRZafhDBqMckyxB1fq4QFZDXT0nt9VVI7CEIw/1HMRhg==
X-Received: by 2002:a7b:c7d1:0:b0:3cf:6b10:ca8d with SMTP id
 z17-20020a7bc7d1000000b003cf6b10ca8dmr873390wmk.44.1667982228087; 
 Wed, 09 Nov 2022 00:23:48 -0800 (PST)
Received: from ash.lan ([167.98.0.196]) by smtp.gmail.com with ESMTPSA id
 h1-20020adffd41000000b0022da3977ec5sm12408609wrs.113.2022.11.09.00.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 00:23:47 -0800 (PST)
Date: Wed, 9 Nov 2022 08:23:46 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20221109082346.2jtw2i6asli5qohk@ash.lan>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-13-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-13-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 07, 2022 at 03:22:10PM +0106, John Ogness wrote:
 > kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
 > are unregistered until the kgdboc_earlycon is setup. This is ne [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.48 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1osgmN-001aSv-UP
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 12/40] tty: serial: kgdboc:
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 07, 2022 at 03:22:10PM +0106, John Ogness wrote:
> kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
> are unregistered until the kgdboc_earlycon is setup. This is necessary
> because the trapping of the exit() callback assumes that the exit()
> callback is not called before the trap is setup.
>
> Explicitly document this non-typical console_lock usage.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
