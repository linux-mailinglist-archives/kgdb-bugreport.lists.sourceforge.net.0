Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB510912A98
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 17:48:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKgUx-0001sU-BU
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 15:48:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sKgUw-0001sI-BA
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 15:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=neX+8CRvvg7ksBoKfiyHEJPasCffPwQipAQb1LpEj8k=; b=XLZabvae4SpWD8a3J0AflwXkHq
 oyKVucA1nw0JrCD4YfCUC/YG8DfMOvGX+uGE5TT/c/icFDUY+J9gR15Y0pEtl5aATbFWevswg9wZU
 LTtjQsMLQOTAjQZNyE1Fstbx0X/askWEK8hj7/r6g2fvpLZ9q1C/FhkbzlmARrEeO9XE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=neX+8CRvvg7ksBoKfiyHEJPasCffPwQipAQb1LpEj8k=; b=Bu4YddqHHsKjoWAYkaSvlVc4Av
 Gk6DqtRXkojh1puMWfrQFwS42eJg7RFm/lshGaKv0Kt48ciHOMhjlh+0K5ASA0Sprk7OYUK3gqPDH
 aizoSZvgyalx+qFeP62DmEKFc5tjSwBAije07Sec6Z6zRsH3FUU/2mP4onWvnlPgROsU=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKgUw-0004Im-Ks for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 15:48:22 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42189d3c7efso24204515e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718984895; x=1719589695; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neX+8CRvvg7ksBoKfiyHEJPasCffPwQipAQb1LpEj8k=;
 b=VGiJiLg10OjQB1W3HAn98tex1yMZpbcuh1sG+AW67GLIFAAKLazoQo6eLW8jhUtUlb
 nRgx1GnsUzQAmZ2QStgRXMGprEX4RiHy3Sg8f2z+O1QqD5tVeu4DeCi9JYww8r20wzM8
 ZfKeCrskMzT2yNIBEMnpNVO1evu2EiUQkolg/+FXooc6BNB0IjgT/TXgh2FE120STnnm
 dn/J21o6ynnY5B6mWBlUYrdPxcK64TaUo0HGCTJuSBTbeLPVWaoP+7eQ3xwLi6gVUi7h
 0QDly+YdUOGjAQOEGwHI8TzoMHrnwnSZdWRF50O5c/NT5/6+TT7gWJ74qhvh+bUapyf9
 8lzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718984895; x=1719589695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=neX+8CRvvg7ksBoKfiyHEJPasCffPwQipAQb1LpEj8k=;
 b=b5f4C8rfgH+S5lRKtrWZiK9nWqtXcS9xwq0eSWM/tzMPMPIK4BLwAjOrlH3bvzgSgv
 MDYr6XhcwJpAE+nRwdOqPcGtJZHv1Id54g7lygT7tO1RYeYyH9xHWak3uz2Pkgah0Xr9
 jtBl9AoScetgOQFuZZovOd5NN1wjYSBNIHy3VfA1QrFIMLDGIEsMF4EFVU0gOfGdyM/w
 LL5QS1ofIJGfObBFAKJUR2Q8oX0pa7iOqfYiDpNjHUWXlXQgG5gvtDqBTphmn4bUxsU1
 /J7hyY4Mpcum0v1ckg1W1W3Z66WoBjACbfowv8GR2KxFITTABUUmhAVtWnSH8YVpMfCt
 uKsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXayUnUXPiWP0HsmqoUJ9WE8iax1Ikjnm/MxS9568KRp4CBiWCwN1FVwTcZCZdeTv/YLUGBmIVTutwNZbIqWf+ZasaJSjLP4qrRJEs+p57Ug9d3pS4=
X-Gm-Message-State: AOJu0YxdFoOorIAG21HbZ9+q714oJOU/L03Izs2Obh0wGpvCdCATi09N
 850XYk0NrwymapuhOCkj0lPvcFtXKrFvTC0fZ1jM72EVVB+Ako/JKyN9TFPHZiw=
X-Google-Smtp-Source: AGHT+IGSN9dO705LMnmE0ip2+Yv9pSi+6V9MD6uEBQZ4VmLNGrxZti+8kFojOGoTosAa0Qj/n+Dl2g==
X-Received: by 2002:a05:600c:4907:b0:420:182e:eb46 with SMTP id
 5b1f17b1804b1-4247529c65amr83989235e9.38.1718984895317; 
 Fri, 21 Jun 2024 08:48:15 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0be9fasm71314525e9.16.2024.06.21.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:48:15 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, Arnd Bergmann <arnd@kernel.org>
Date: Fri, 21 Jun 2024 16:47:50 +0100
Message-ID: <171897701322.292511.3640595078155351181.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528121154.3662553-1-arnd@kernel.org>
References: <20240528121154.3662553-1-arnd@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 28 May 2024 14:11:48 +0200, Arnd Bergmann wrote: >
 When -Wformat-security is not disabled, using a string pointer > as a format
 causes a warning: > > kernel/debug/kdb/kdb_io.c: In function 'kd [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.48 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.48 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.48 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.48 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sKgUw-0004Im-Ks
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: address -Wformat-security warnings
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
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


On Tue, 28 May 2024 14:11:48 +0200, Arnd Bergmann wrote:
> When -Wformat-security is not disabled, using a string pointer
> as a format causes a warning:
> 
> kernel/debug/kdb/kdb_io.c: In function 'kdb_read':
> kernel/debug/kdb/kdb_io.c:365:36: error: format not a string literal and no format arguments [-Werror=format-security]
>   365 |                         kdb_printf(kdb_prompt_str);
>       |                                    ^~~~~~~~~~~~~~
> kernel/debug/kdb/kdb_io.c: In function 'kdb_getstr':
> kernel/debug/kdb/kdb_io.c:456:20: error: format not a string literal and no format arguments [-Werror=format-security]
>   456 |         kdb_printf(kdb_prompt_str);
>       |                    ^~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] kdb: address -Wformat-security warnings
      commit: 70867efacf4370b6c7cdfc7a5b11300e9ef7de64

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
