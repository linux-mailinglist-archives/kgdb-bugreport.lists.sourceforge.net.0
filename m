Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19040FA4A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Sep 2021 16:36:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mREyo-0008M8-NJ
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Sep 2021 14:36:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <dianders@chromium.org>) id 1mREyn-0008M0-8h
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Sep 2021 14:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o0d9ENKOVye+QJLjqmO0qleTfZvpM7VavMc2OJ5jdbg=; b=Z3YsvyMF8UqyR1XoF1DfIzaK8F
 Jfb7Z69CeQCREvxH79dCqeIGve3X7z5IoTmWsN9jqAGVq2WTqv9rZsEWK779JNQe9dP2fdrtsRzZI
 Je5pYXKgh4lLMe3HONM71gD7JdPlWo3vpYmcJy0b+CplIuJ+m04u77Ro78RfJfIVIBuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o0d9ENKOVye+QJLjqmO0qleTfZvpM7VavMc2OJ5jdbg=; b=IfpYfYs/HDcqKztYWTe73ef4U4
 y5v7/Yr7vS/9K7j40cISp0oNZF54Fg/raQiQj+ON1IYdBInaHiu1Mde1NDj02kfQHYKaMQr0RfuDl
 WRQPC2h2h4VSyOPFkwJDsqCxc8tsW5117d+wMIYbBOMBDdZ0XQgoJNJqJEECs3f2T+GI=;
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mREym-00Dssq-Jp
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Sep 2021 14:36:41 +0000
Received: by mail-io1-f52.google.com with SMTP id a22so12453526iok.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Sep 2021 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o0d9ENKOVye+QJLjqmO0qleTfZvpM7VavMc2OJ5jdbg=;
 b=P5L9ocytth7pEfd0Icoj1B0iikx/Zuj+Wk2wt37PE5q+dmwO/lEQykdVWm9qdGbPeN
 glQmmG4aGC8NgEnsJkBBo3t/5WmPGyrPFL/KRUnYqs8DdenTO+Aom+Sx9CA8GKqka18x
 9JxQFcoe7dVEEfDMKb6dyJW2Z6jTp6ccgUhxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0d9ENKOVye+QJLjqmO0qleTfZvpM7VavMc2OJ5jdbg=;
 b=SvAFuv7u1PK6t5MxVgG8P541d2CMaoqljwm5HpFintriWMYef+XMLAx6em3dLe/Q7N
 DiYIdaOLapn6ZkztafuUuf5XVHe8C0hbdhUTRl2tBBKX/L2mOnWXHf9OC2XoUxwDS4Y4
 EV4Ai7LjEmWE9ZpU0zdS7tGuJXtguHtG/2HM73ypxMtCq/J3CofjWn0rqw3PbgU+jrO8
 BosqF3YFexwsomLuTXwIR8exPHjWnoppiuI9w8GZIpZ1mcDCQmY2DcjtWZS81/TtmqkQ
 piL9sNmV3UjGIP+3QwjNOmEKFPJi9xCrbokBq+yJRW1ZdygEMZEnH7OYnHd8/z1OCk2s
 9wuw==
X-Gm-Message-State: AOAM5339+cYtQDk9/OK/D1UDmQUL5yREeOQKVwyJCf3tYRznuw8UzS0a
 Qh6F0oxm/Z+CGCsXvOnfstkwjf2TeVewqg==
X-Google-Smtp-Source: ABdhPJz7hppWruyOgSjgbmFqGnRMLqTyE5m4V59VaNEtSc6oUVGhNkaANs7uM8T0eZUQ+Oqkb5KMug==
X-Received: by 2002:a5d:9051:: with SMTP id v17mr5365020ioq.134.1631889394885; 
 Fri, 17 Sep 2021 07:36:34 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id c4sm3631222ioo.2.2021.09.17.07.36.33
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:36:33 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id g9so12450007ioq.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Sep 2021 07:36:33 -0700 (PDT)
X-Received: by 2002:a6b:3f02:: with SMTP id m2mr8713467ioa.136.1631889392707; 
 Fri, 17 Sep 2021 07:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210916154253.2731609-1-daniel.thompson@linaro.org>
 <CAD=FV=Xri+J2=iQzCHLxB+ksT41V6Rexp+BXWi6Fe7=jq3oTFg@mail.gmail.com>
 <20210917081816.kkyvqbdptnyke5jp@maple.lan>
In-Reply-To: <20210917081816.kkyvqbdptnyke5jp@maple.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Sep 2021 07:36:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X1B=+5BtXt=x09uKszYRAzGLEF8dr3ad-2Jp9qRy-_hA@mail.gmail.com>
Message-ID: <CAD=FV=X1B=+5BtXt=x09uKszYRAzGLEF8dr3ad-2Jp9qRy-_hA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Sep 17,
 2021 at 1:18 AM Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > > > Worth having a "Fixes" for the patch that introduced the warning?
 > > I'm never sure how useful Fixes: that po [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.52 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mREym-00Dssq-Jp
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Adopt scheduler's task
 clasification
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>,
 jing yangyang <jing.yangyang@zte.com.cn>, kgdb-bugreport@lists.sourceforge.net,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Sep 17, 2021 at 1:18 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> > Worth having a "Fixes" for the patch that introduced the warning?
>
> I'm never sure how useful Fixes: that point to the dawn of time
> actually are.

I was just thinking of:

Fixes: 2f064a59a11f ("sched: Change task_struct::state")

I know that the logic was still wrong before that patch, but before
that patch at least there was no Warning reported.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
