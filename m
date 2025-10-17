Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C8BE7FD7
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Oct 2025 12:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9xyALGN85nPY1zrLSOJj02jR9vGm86X8D2hlcxzWeA=; b=cURcOKECuGLSRgbL84nRWByxzV
	Ng3EuH1PoyLfYYV5cbwHXJivpvCAajB0KLcP7hBrJLJtg7SPPioyzRi2kMOHIiTKNIAlf0I11Dwz0
	3N9eyn5MDZ9FdQD9wRFVUaEbK6IqUCr0i3bazMFxrcl1FLQO7pvSCXI77ZqCuSkyK9ow=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v9hRs-0003Bo-8F
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Oct 2025 10:12:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1v9hRk-0003BY-MU
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 10:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IcAE9gTZ+/oZemSW/gjSvTAcO1JCiHDPx7fInOY/f2o=; b=QVLCCtZrF/Pmb66Rp47MXs+ChD
 M0MAnZ4kCDQbEwkuqIe8+AfDMfqADMtN2qGw1b+Rhjik528p/tXo1eQQuIifdp9f4ScNGhe9RBeYh
 ThcfAe6C/BRptYrfkBPf8oJluTFqHyh/IM6oTk1p7m4At6E/hpR3Le8+ENV7bMfEOK9k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IcAE9gTZ+/oZemSW/gjSvTAcO1JCiHDPx7fInOY/f2o=; b=Bn5uKnS1KtUJwEGOJHywpentVH
 JwKiKRC09xakSx8taF0P2JQZJHAUTNKcYdstcMbVrx0kX12joHC/f6oqM8DM3SGyqMWSVthT23Qc7
 m9WFuznDAOoVrAuWFaDB3An82CcyiTAJF8iLS+N/DgCdkpw8zqi+di4ibnkjQNEdEZMw=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v9hRg-0005yz-Gu for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 10:12:24 +0000
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso13045825e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Oct 2025 03:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760695938; x=1761300738; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IcAE9gTZ+/oZemSW/gjSvTAcO1JCiHDPx7fInOY/f2o=;
 b=d+RRQJSft8hO4coAmh1m2pERp+Xhj90wjTabLgAqqW3S3hLVbUtzVlm23wU+9yIykg
 Z2kZ1VF2Vq0EVEzwwHAByeAfIrMbSdkuILGPs6V4AeL43eTZuX+A4HtomBPTwJG9U5Tu
 Zw3q/Yk4a6ob4XbbkTXjgHWj4NCFkyus03GMboFvQuB44oENhQ6YGTtUWq/qWGhGjZer
 8QLzzAzFJPp8l/+R1KoFl5+W2giG/XdfKavI8Ytc8fIhAmjNxVblJVl2sK5l5X9EZUye
 kB0vpU1nomAi1VNA0IiBxwVnPJoxfu/qjZ/NeZpkNG7aHWjxwVaYv4wsAW/iPyqiH/y7
 Cr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760695938; x=1761300738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IcAE9gTZ+/oZemSW/gjSvTAcO1JCiHDPx7fInOY/f2o=;
 b=GmQnhDJk7fqTl8dIy/IDJYaRuQ2cfNxyc0iLgg5QF9cD8DFhhn+AIkM669mbnLz8ri
 gNLbe9NCzhXPkAyd/Tb4Y6NqOfx22Yrz9dzzyD4nha988XUsxfrwxpgPkvYUberuD0DK
 2NfyamF5rc1ETbXIFZ2VXLGJf8NpSqdedD4jd4NKqYhKcjWEOUxgrsicj5lhlJvSZhcp
 NvkfXs9GFzUn14bLPjgE/M3QelCiG6IYe65db47SuGRRkvuZx71ODWGZF70EfzY0em73
 irRvQZKAK1PC7DTPLZjKChtiIwfy3JOvphkmwg1npxsT56TvAzBTzZnqhK4+C7pw7uNn
 62Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxKz4IB3BjUxjwT1p6in5VjlEfd+TKMGHjNMTGZPEr9GUaa4atkDf69Z7EJNMja2IDB3SXu3bUI4X+7Z6uDg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwkM7ieS/MXfqpfKD+ucxCnWwQEuXgDDz8z8EN/AvnGcoIpb8e9
 Zf+9hORV4cxAT/VRMJUwOkSnJKZu/ijTFgtK/Dt75ENCpXXjKYa0fi2awyr+8ZPA4Bg=
X-Gm-Gg: ASbGnctWEy/CzIqY6WKLQtC9/Yf4Zu11tTZeJKlljqh/lVjRqGyfKWiNN7lj3v1paL1
 eoUzC3tTqKrF+RCkYaDtoVja1DonaiQbIWLU/CTtlbwyUJazjQADvryZyAU4/+fPnx/3jIDF1HJ
 ydjaqdmdo+wucz5SK+7n+fLyqHQVn8OnDB9FO+ybt43SVimuqHchscWkyiR1Idb0Pm7InsGAB4b
 87CIReBxEaLmgDaMxZ6ZyVSjINzEQwOr6+shgliYoFQkWivz5qefNuGoJnnqeZoxacmw7/nC0u2
 0sNhYMhoD/fhCxyqzMbYLrdl0G0IgpGi0wFL8ZOhvI1vsha/z0q65QgsHvZVVKp2xJCkfsq7eru
 NIMJM/HCnZgY7nLRmmcziO+6ZaPxPBs+BwwZQc8IMlLvAYpJs5hVniQf/k5Xnuaqz32C7Q1k7Sp
 wLv7s+ipjLJWG3lw==
X-Google-Smtp-Source: AGHT+IFPljBKrOVB/66ijJCXVaRvUIH/JjXGzjIhcC63OF8E63IkVl0Uh+QOhjfWccM7pXPnZ0iuRA==
X-Received: by 2002:a05:600c:3145:b0:45d:e6b6:55fe with SMTP id
 5b1f17b1804b1-4711791e7a4mr29591645e9.34.1760695937835; 
 Fri, 17 Oct 2025 03:12:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4270665efaesm3215957f8f.27.2025.10.17.03.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 03:12:17 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:12:14 +0200
To: kernel test robot <lkp@intel.com>
Message-ID: <aPIWfjBhFPjOmESL@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>
 <202510171023.YREXxhMK-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202510171023.YREXxhMK-lkp@intel.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-10-17 10:17:37, kernel test robot wrote: > Hi
 Marcos, > > kernel test robot noticed the following build errors: > > [auto
 build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787] > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: suse.com] [URI: 01.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.128.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.50 listed in wl.mailspike.net]
X-Headers-End: 1v9hRg-0005yz-Gu
Subject: Re: [Kgdb-bugreport] [PATCH v6 5/5] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>, llvm@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, oe-kbuild-all@lists.linux.dev,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-10-17 10:17:37, kernel test robot wrote:
> Hi Marcos,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
> base:   3a8660878839faadb4f1a6dd72c3179c1df56787
> patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-5-866aac60a80e%40suse.com
> patch subject: [PATCH v6 5/5] kdb: Adapt kdb_msg_write to work with NBCON consoles
> config: i386-buildonly-randconfig-006-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510171023.YREXxhMK-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/debug/kdb/kdb_io.c:612:22: error: incompatible pointer types passing 'struct nbcon_write_context *' to parameter of type 'struct console *' [-Werror,-Wincompatible-pointer-types]
>      612 |                         nbcon_kdb_release(&wctxt);
>          |                                           ^~~~~~
>    include/linux/console.h:667:54: note: passing argument to parameter 'con' here
>      667 | static inline void nbcon_kdb_release(struct console *con) { }

This should be:

static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }

Again, no need for v7. I could fix this when committing the patch.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
