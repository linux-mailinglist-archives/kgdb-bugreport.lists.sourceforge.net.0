Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E677E7C530
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 31 Jul 2019 16:43:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hspom-0008Vj-AP
	for lists+kgdb-bugreport@lfdr.de; Wed, 31 Jul 2019 14:43:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <swboyd@chromium.org>) id 1hspoj-0008VT-OA
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 14:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:Subject:To:From:Cc:References:In-Reply-To:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XVFrKalXLRegBW45+spzUS0bWpMUOiP79SdvvKgnepk=; b=I/B+/EJo4hILs9hwhcp8uuzbwq
 LpdbxUmNQTXvuG6gteQ3Uic+0ObO7fLoJcLC+4jRYMBs05c1SinJqooznmq80sMQS6DlOJ6ocqnRF
 ABwtvGZxVQG5xY0oT/r8q7OEJ4jt3VHJYs5n6IDi6FuFQ1TsiL2nuqo2xxLJYESVOX1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:Subject:To:From:Cc:References:In-Reply-To:Content-Transfer-Encoding:
 MIME-Version:Content-Type:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XVFrKalXLRegBW45+spzUS0bWpMUOiP79SdvvKgnepk=; b=i66qpEUahIhgi6XYZNck0tKRsH
 mT0O4CC8R+I5CJq/Y5B6PEzlYG5qDH/athYXCdFyzSY1XL+v1s9Uw0fTiSMUfUClMQDFJ95/YQNpw
 m/vTgD6qnwrPauGlAkkOIB4xVJlezeLoaJJazpZEQdZyzZnYMIrdK7pFh4Bk69xpIf2g=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hspoh-005kHX-W7
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 14:43:01 +0000
Received: by mail-oi1-f194.google.com with SMTP id w79so50958201oif.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 31 Jul 2019 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:cc:from:to:subject:user-agent:date;
 bh=XVFrKalXLRegBW45+spzUS0bWpMUOiP79SdvvKgnepk=;
 b=iYMkFxzSu8BzSe7iyLl3BplH8dqGn8BPphddF/VAx+cUW9kZA2uSxyTTctnwXO6Qgu
 xfqowa6cQFgp6OAzQNJAhr1aePeF+3u9xeQc+LQmNZndWZHTcwH4LHAwWumTYwVPv8hA
 LmTAADFLPQw6F8CfcaiVIKfF14a7h2kpyYfd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:cc:from:to:subject
 :user-agent:date;
 bh=XVFrKalXLRegBW45+spzUS0bWpMUOiP79SdvvKgnepk=;
 b=qldxNen85+odwCm3s9N4pe2QfmXaWNhAiNwR15NNqjoE0QOLtTtnoTOB5o9oiflGMq
 wL4txv/SrETT6wK/2Q5fQQW14qirkqj+y1lO593A4SINkPYP4YoM5LJFYzVOz7X6DC4u
 nHOhj/Ia3uJHDUkgdx6SyRUZwS8dWSdexdLwpBZCEh5w5GmeSKvJW7e6hy+t5/r0qVC8
 bCGc0EcMrjEmrmSXec67ZrIUaSSsxZv2ubqigUX6wsylEJQeoHIuZGZHMYSgMlsXjN1/
 NqW5oiBzAo09sxGWSzKY1iVoboU/uhBjQeJzClKEPqkh+KerkBvNUbh1xUb0jbAwDjkI
 O93Q==
X-Gm-Message-State: APjAAAVubJdmV76IMvtetescp1fKuBqbJg7VpF757WvuVjskoHUaw8Vd
 WYLPWXp2qFx+SLq88L7sSjx74cHztxi3FQ==
X-Google-Smtp-Source: APXvYqw2wiw/+RDnWb839aBeqYUakyy+ryIDb5GNRAP4xZ5xaqeatW6EHGUQXPb2eUVOlEHXP6EDaw==
X-Received: by 2002:a63:c23:: with SMTP id b35mr80255223pgl.265.1564582626723; 
 Wed, 31 Jul 2019 07:17:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id q63sm89283386pfb.81.2019.07.31.07.17.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 07:17:06 -0700 (PDT)
Message-ID: <5d41a2e2.1c69fb81.192ec.ecd4@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190730234052.148744-1-dianders@chromium.org>
References: <20190730234052.148744-1-dianders@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>
User-Agent: alot/0.8.1
Date: Wed, 31 Jul 2019 07:17:05 -0700
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hspoh-005kHX-W7
Subject: Re: [Kgdb-bugreport] [PATCH] scripts/gdb: Handle split debug
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2019-07-30 16:40:52)
> Some systems (like Chrome OS) may use "split debug" for kernel
> modules.  That means that the debug symbols are in a different file
> than the main elf file.  Let's handle that by also searching for debug
> symbols that end in ".ko.debug".
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
