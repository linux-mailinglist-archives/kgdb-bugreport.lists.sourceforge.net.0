Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD65A0C4AE
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 Jan 2025 23:29:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tXSvq-0008Pa-RO
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 13 Jan 2025 22:29:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tXSvo-0008PS-VQ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Jan 2025 22:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0PDNivUOGJgszEL5Jno3HjSzxcoU00wDvKdb4vppGXQ=; b=K4UqzTgLOhin5iE/JFghT9bouZ
 OJUa8OKUa7VfW5TNmPAZ8IbAV2TBVgMLHHD7GXonTNqMG0AyWlcq2eZaBbZbmQhAFrwFBNUc2dd2N
 YaqjorkhocybisdkMMYmQhOsQOYwqxMFZ9Ez3GrRfy+JcEsASRXR78R/QuRPGciKsqE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0PDNivUOGJgszEL5Jno3HjSzxcoU00wDvKdb4vppGXQ=; b=j8j9mIL6DzXYpaQ0LBTpL4Oof1
 BW/2LC9M3O5MrUdyQFLEyQacOI6ja3dZMyFU+1NUszNcAZPE1eeMtmwAdmTVLqNv3y4CvlydQDAV+
 /zsW3fGGHFeza9P1HowzmX+YfypTLd7AaQSuztTLJlM5HM8Vf+1asP76MKKNpQ3dLEs0=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tXSvo-0000Wf-CH for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Jan 2025 22:29:12 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso55413085e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 Jan 2025 14:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736807341; x=1737412141;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0PDNivUOGJgszEL5Jno3HjSzxcoU00wDvKdb4vppGXQ=;
 b=Cna444nko5zF/3/VEfKvC8KTRjgDJKTd9tT+lkkt03oTFQQX8hY1AZ+0L7rzsA4uTc
 VwawVrPrND1gMaO+/vd80sEvXitiiHx5A8I1yNwRorKEn3VXgwcGUbhEibV5fuiXkPVE
 fhXvQqbqkqZvxd2Dfrz8rl2+l5BAMnycEXZUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736807341; x=1737412141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0PDNivUOGJgszEL5Jno3HjSzxcoU00wDvKdb4vppGXQ=;
 b=TvxUkNlJJgK5Xu8n8XeywveFyh+kadb6dcs7G6bSnc7FZX98tp97qboU7wUzH7jBKX
 Zy4pmnLQQ8uxuK2Mn1pkVQaN2MqFNscqqgQC/ALvuQA/NJLeai0Vyg3fOh/DfeX3GcDW
 C2vA9QUqnhnO72hLiXT++QUeBdU7ehD1Bs2EGNCn8ppBRzzW2gd5A3h/yalEqKF9QmIJ
 eQDhklxlN+z3SxpXo5AUWX5ArEwx1FfpbfNruS2OhlhKNBseV6xsylN2fo4q9v2/Kiuw
 sFj3snDD2y4/Yds2LySTTVMBf308rpnpna9aR98eR1CHI5UPIv9XVn+hZOAOtEBt/DFz
 bX/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYaHu25gWeoS4prsLwuXrwKv+wX3xCHwtftnpWQUMWPj2lwGPMu78SpixjIn/D4IeVgvsgSUSInwnbvp1v0w==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxCNuz0NX8QpBTaBKrJTAUMYyeXz58USWQK/KbwIcVnfRMZxkAr
 PmV8ANtApOpb+BntxCNzjzorAnbWnbxln4lAVPlv4fV09/RvaYFG8NvgaD6IXZvX1s8IOXtD7v5
 UfvoK
X-Gm-Gg: ASbGncssJT/r0iKP+xP5KgWst30WXCVfwJw5eXm3mnBgMJEjSoV8BX2gK+Vou1cDQY8
 +I1N0QDJDa/5AaIR83+MZ0046nPXbmf3MU/4h1FK49fJDcSJCKW15P5lBXv4oAkezTc2/Vgc0oI
 wGpg++EAoxmjB0Itu1K0KHkrPJil3EnKwb6ld32aaNAfYpzcnFHHV4vV1z7fSJCLYiaTLi4c2aS
 PS2F8drFVPKpsQPz3r8q9dfzkwv3L5BI6v2IEcknNtBb1ZOnFTZxn7X/uouf+jO/Aw7I6Xi7SJq
 HDy2dUSGDluSWk0OCGN8
X-Google-Smtp-Source: AGHT+IH2Qnkk3GXFqE9yOvN7zZfMfgjSlUGI1bSE+AtF6lHX4+tnRbE9/vyC9HUeM9DHNZ8khU03Mw==
X-Received: by 2002:a05:6402:5244:b0:5d1:1024:97a0 with SMTP id
 4fb4d7f45d1cf-5d972dfb883mr22093688a12.6.1736803591168; 
 Mon, 13 Jan 2025 13:26:31 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99008c2d7sm5402627a12.3.2025.01.13.13.26.30
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 13:26:30 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so2304979f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 Jan 2025 13:26:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUWcCyaF6zTLoyXRjBmX39ZQMscGc9DnQ8B7YiNTNpSGffmSlrasznUmx1UxMXKRrTD+PE43zZdA+OD6/HaiA==@lists.sourceforge.net
X-Received: by 2002:a05:6000:4b0a:b0:385:fae2:f443 with SMTP id
 ffacd0b85a97d-38a87313975mr20221352f8f.34.1736803589980; Mon, 13 Jan 2025
 13:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20250112012049.319515-1-linux@treblig.org>
In-Reply-To: <20250112012049.319515-1-linux@treblig.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jan 2025 13:26:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VMYQMHyrDjmEKbS5RkGFj56T1rmUSq7AA6zrer6vY7OA@mail.gmail.com>
X-Gm-Features: AbW1kvZaOQGyoK6z2ZYz2f3t-xcTrnKwPkVaTxVfauZuwr-6QsjxIcZ7LenSqQw
Message-ID: <CAD=FV=VMYQMHyrDjmEKbS5RkGFj56T1rmUSq7AA6zrer6vY7OA@mail.gmail.com>
To: linux@treblig.org
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Jan 11, 2025 at 5:20 PM <linux@treblig.org>
   wrote: > > From: "Dr. David Alan Gilbert" <linux@treblig.org> > > kdb_restore_flags()
    and kdb_save_flags() were added in 2010 by > commit 5d5314d6 [...] 
 
 Content analysis details:   (-2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.41 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.128.41 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.41 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -1.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXSvo-0000Wf-CH
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Remove unused flags stack
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
Cc: kgdb-bugreport@lists.sourceforge.net, danielt@kernel.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIEphbiAxMSwgMjAyNSBhdCA1OjIw4oCvUE0gPGxpbnV4QHRyZWJsaWcub3Jn
PiB3cm90ZToKPgo+IEZyb206ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8bGludXhAdHJlYmxp
Zy5vcmc+Cj4KPiBrZGJfcmVzdG9yZV9mbGFncygpIGFuZCBrZGJfc2F2ZV9mbGFncygpIHdlcmUg
YWRkZWQgaW4gMjAxMCBieQo+IGNvbW1pdCA1ZDUzMTRkNjc5NWYgKCJrZGI6IGNvcmUgZm9yIGtn
ZGIgYmFjayBlbmQgKDEgb2YgMikiKQo+IGJ1dCBoYXZlIHJlbWFpbmVkIHVudXNlZC4KPgo+IFJl
bW92ZSB0aGVtLCBhbmQgdGhlaXIgYXNzb2NpYXRlZCBzdG9yYWdlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogRHIuIERhdmlkIEFsYW4gR2lsYmVydCA8bGludXhAdHJlYmxpZy5vcmc+Cj4gLS0tCj4gIGlu
Y2x1ZGUvbGludXgva2RiLmggICAgICAgICAgICB8ICAzIC0tLQo+ICBrZXJuZWwvZGVidWcva2Ri
L2tkYl9zdXBwb3J0LmMgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMSBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVy
c0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
