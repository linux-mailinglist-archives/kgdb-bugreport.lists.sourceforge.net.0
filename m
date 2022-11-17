Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC6C62D050
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Nov 2022 01:59:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovTFv-0006mI-3E
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 17 Nov 2022 00:59:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ovTFt-0006mC-9R
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 00:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=457d9iQgit+Z1EJB0nqQekgVdEZwOgAEMvvOEWPkupI=; b=fmvcR5fqPEajOXxaAWqrvKTe1L
 I2MfHOdP9h2yaGo+VN2UPR8w90G1iOqfLhx4HEOFRM3RDWjcMuV5K7xCdx+gcNf28DUmZ+oUhsf7o
 YTBuDkJlGMZ9Fcu9KgZKXngTkEKXb11QUhrxX5nIs13URNWeyxLDh806vGoZ79Z2scgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=457d9iQgit+Z1EJB0nqQekgVdEZwOgAEMvvOEWPkupI=; b=Tc9eGutGvmK8Yb/bMwtq/dAQn8
 4PFicAF9izaWHTCOkjp9xHK8UsWkWaCYLDuSVOKdllAokHbfAL6IZjQgZpCqZJ/HFlmsf3i0AICZD
 79vA4HejKah+4SGZP2U/J8W51KgQ1o+GQRf8PSD7VnS5XbsvEMYjHVHuTUxSi1JlFRe4=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ovTFp-000052-G4 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 00:59:49 +0000
Received: by mail-ed1-f48.google.com with SMTP id s12so393170edd.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=457d9iQgit+Z1EJB0nqQekgVdEZwOgAEMvvOEWPkupI=;
 b=Bh70kUdShhAGETdykikAQJOKTnFptoZPW3kSYZE+AGERi5jQgkT24kHTMqNAWR10tU
 BuAeJQu/Oi7S5Fcd6875vVxSldt7DeCbJfaCEzyokpntEoPmNCfgg0zYiuf//Cx60LbX
 eL07Ybiq3UPZ7/QNaNsuVClF+LzfF5L0ZCzFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=457d9iQgit+Z1EJB0nqQekgVdEZwOgAEMvvOEWPkupI=;
 b=7P6E804GDpMYdE5pr0DXFzPF0lrzV4neih7rOPGiduyjVVJB05Mu9SkIj/5JmkQKk8
 Ce0qOFhmkudcueXCtpLYPJuRDHeGPrbn5HLucfKvl5sTv0NT4eNq3GgQnyI8BqgXRvP7
 LhlpGwEzhZRqXw4/r+UZSU/rncLXdLKlIs7aMgyxhKjeCNimF363ggID0Cd0RmqNLWgJ
 PMGcDt5McfmiUViqZ85aP4px+ek5/R7MQokDGjH+1yPz4Z4g7iVxDpr9pQbyG+ChEWMR
 ZgUd+VewcZ2ISWaNnxeStKQS/qDmTA9v/UaU1YQxa0hk3y7Q+h9w1lQWFSR7hyq13Jgs
 sbgQ==
X-Gm-Message-State: ANoB5plbTApwVxExs+AgBe13fIdttUWgqkodGXfXwxeP+cSoT8vsu/hY
 R8dBpmP4eGnyqvdkkX7TTjUGUNmQTl2qQQ6z
X-Google-Smtp-Source: AA0mqf6AXEXDgC1DC8mA+747QUmUAN5mQYV35XB4dWVYUpWk2DHRVOuwRnf/rhZP5l8M7HW9BRAUcw==
X-Received: by 2002:a50:fc11:0:b0:45a:1bfa:98bf with SMTP id
 i17-20020a50fc11000000b0045a1bfa98bfmr172327edr.413.1668646778313; 
 Wed, 16 Nov 2022 16:59:38 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 c1-20020a17090618a100b0078b03d57fa7sm7456910ejf.34.2022.11.16.16.59.35
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 16:59:36 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id o30so147311wms.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Nov 2022 16:59:35 -0800 (PST)
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id
 ay18-20020a05600c1e1200b003cf9ad3a20emr110075wmb.151.1668646775488; Wed, 16
 Nov 2022 16:59:35 -0800 (PST)
MIME-Version: 1.0
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <20221116162152.193147-37-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-37-john.ogness@linutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Nov 2022 16:59:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XhkmOLXnfc0YQyUN-FvNeoF1+=zvp56ttaYvsoKESMdA@mail.gmail.com>
Message-ID: <CAD=FV=XhkmOLXnfc0YQyUN-FvNeoF1+=zvp56ttaYvsoKESMdA@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Nov 16,
 2022 at 8:22 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > configure_kgdboc() uses the console_lock for console list
 iteration.
 Use > the console_list_lock instead because list [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.48 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.48 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ovTFp-000052-G4
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 36/40] tty: serial: kgdboc:
 use console_list_lock for list traversal
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

On Wed, Nov 16, 2022 at 8:22 AM John Ogness <john.ogness@linutronix.de> wrote:
>
> configure_kgdboc() uses the console_lock for console list iteration. Use
> the console_list_lock instead because list synchronization responsibility
> will be removed from the console_lock in a later change.
>
> The SRCU iterator could have been used here, but a later change will
> relocate the locking of the console_list_lock to also provide
> synchronization against register_console().
>
> Note, the console_lock is still needed to serialize the device()
> callback with other console operations.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  drivers/tty/serial/kgdboc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
