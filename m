Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5B6FC7A5
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBn-0007ZI-UN
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pulIi-00085b-5v
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:To:From:Subject:Cc:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=evsRyVdUpm9tZ3zbpYtyLZiIFPAu7MWLlo8c04t+4vY=; b=X1ymwtOauHggV+TulcxfXO3laH
 3OrnhasyIHn+Qe8KL5WTt0Igw28MHAsTTVwsehT7chZMWlmpnptcoMP9A81ocO1HT6sHSNQJiVM00
 VIYtwAlAHOwPItSOWwEdDmKqAyxtGdgozqH0JsGHC3fJWnlm0GBP1sng80I2RHaYETcQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=evsRyVdUpm9tZ3zbpYtyLZiIFPAu7MWLlo8c04t+4vY=; b=Mg2gGLXhHYCSyo9IaOxhCYnYng
 WdOVgWxnwysORgVzd0Gx9a6inMrdZaj+FBTxWc8fyKz0p9hybHlMWotL+CkQrmKylUfV1tjlWrtfR
 p21EGnvbePHkKRtNKciHU3WWvae1eXlnLV5j7co+jSt+irLTFoCcGVnN9QAwx/M7lCPo=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pulIe-00025Q-At for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 02:36:04 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6438d95f447so875866b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 19:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683254155; x=1685846155;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=evsRyVdUpm9tZ3zbpYtyLZiIFPAu7MWLlo8c04t+4vY=;
 b=bPL3OQA2wcMMOXheYlA8QxViGjC7iCOlxPhX4fuvTbvsINcXnCzBLieoUCDzT+56/k
 9oa+q6KgEYTU31LDEubBwLHoV00eSRef0d7RY6p7N+38ZnXUiPoVuqktGot/CApk96Jy
 mkcd9MflN/bd4aJpaHOyZrzKqFPxkUSgtFeghcahGyjw1M4LGoXeflS5xTbaaMroQ3lN
 TDdNlHzCw9doNfMqYFNpEN+WF6Q8tEWDbjhFSHNaJRFseTWy9ZNqsOe1xYRvqprN7XWn
 oaXxe0JlYPbYRI/LrFIdnf60TDci+s8NR28f2bWdctusrv2FqThGA2JB0SFqFGVL9us2
 jnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683254155; x=1685846155;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=evsRyVdUpm9tZ3zbpYtyLZiIFPAu7MWLlo8c04t+4vY=;
 b=YgaJXQUoHPTvR/X4VFaSeeL3YtAU6tncZChnF0HM/01p94ASTfeM7l/uquKR7U4CCL
 oKLQJdCKq2zn2HEQQbzX1fnNnBJqH6cNQZnQv3DQ6+SxD9DGh72tv/dcXOzDk16Ii1zP
 3yJvxECWeZP1/VPRJGyRBP2CRFoTqfvisinsxRN2qUk9RjS36Nued2kVQIgcXTRZKkrv
 TaJ5JR3SqTm20dO0K/dEAP4v0B1R6gZ4FHt14J5hcN/3M7MPDnWnZebJgdqGQ+bBzI8U
 0ZAPrmeLeqPOfrQ3b+j3N3RNxHZlh5S8M0SVSNLaxNsQoP+biM0NEWXDJChpGXUb8hLy
 UpMw==
X-Gm-Message-State: AC+VfDy7A/P9OhaGtLxU2HbHx6TRhxB6QDvgdyctRvyBehYavbqPsEOi
 P0o0fsPq3+8vzQLDfarhpdQ=
X-Google-Smtp-Source: ACHHUZ7SP5ujyT52IJy91MGux44+fALAl/Za+uzONf57QZ4t+E/ySlwSCIJZv2DqIpZSwxLv82pD9g==
X-Received: by 2002:a05:6a21:999a:b0:fc:8dfb:3195 with SMTP id
 ve26-20020a056a21999a00b000fc8dfb3195mr5404412pzb.23.1683254154649; 
 Thu, 04 May 2023 19:35:54 -0700 (PDT)
Received: from localhost ([203.59.190.92]) by smtp.gmail.com with ESMTPSA id
 g18-20020a62e312000000b0062dd9a8c1b8sm407591pfh.100.2023.05.04.19.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 19:35:53 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 May 2023 12:35:39 +1000
Message-Id: <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
In-Reply-To: <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
 > From: Colin Cross > > Implement a hardlockup detector that doesn't doesn't
 need any extra > arch-specific support code to detect lockups [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [npiggin[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pulIe-00025Q-At
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:34 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 13/17] watchdog/hardlockup: detect
 hard lockups using secondary (buddy) CPUs
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net,
 ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>,
 Colin Cross <ccross@android.com>, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
>
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.

Powerpc's watchdog has an SMP checker, did you see it? It's all to
all rather than buddy which makes it more complicated but arguably
bit better functionality.

Thanks,
Nick


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
