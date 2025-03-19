Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66421A69BCC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Mar 2025 23:09:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tv1b1-0002RU-PT
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Mar 2025 22:09:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <justinstitt@google.com>) id 1tv1b0-0002RJ-Cn
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Mar 2025 22:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pvlkhTWhAzJ84g1RHdy0S3etQzJbxZ8GWKau6gHnWHg=; b=kxZNIowIYmp1YyvwzI+6fUqs5B
 9nVhivliALpae0v+myAnie732QkVYHIZrGbiP5Jej2k44gy2Vl79Om0+J15/o7XCCukg6XWmUwGZr
 1X02dpmZkRyOmfELMiz7O1q4EQMO5fQX0OIaPpKp8M7dK782GLwMvBo/IS8zj24BaCMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pvlkhTWhAzJ84g1RHdy0S3etQzJbxZ8GWKau6gHnWHg=; b=aqxBE1luODaVhOoMNpklWuyP+B
 qyJuOVWnAgLMBrBRUV2IgHM8KGpNt61yTGcJJdABtElQ/IfKHmNeN0mMZPM4fF4OjXgYblmQ4ns1N
 PUK++sDHlcBQZrhaxt8WVNs/g+UuJZ8gBNqh0zHvATKguwqpWSZJwClN2tW70deLhPAI=;
Received: from mail-qk1-f181.google.com ([209.85.222.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tv1b0-0005RN-EE for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Mar 2025 22:09:07 +0000
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7c54a9d3fcaso19244385a.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Mar 2025 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742422135; x=1743026935;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvlkhTWhAzJ84g1RHdy0S3etQzJbxZ8GWKau6gHnWHg=;
 b=hrG09ZqWaJHP8r7NnNL7Pu1hse2PTWlqtMkQdzitd6+Js75zme+87S3WDY4BVapqoO
 5LXjhMW0I3pXTh5AhPmkyxNfStDEHiRvCk6vcJzqo5YLivqW5fEZW/tZLOKX8aRZ4OYq
 MxyYXTmdZkCZwrzfQwHW4pY53DzmTSG5bbYGOfxaSrfGdlPlxeHfjAsO5agha8P68IxV
 fOLtVMCeZwQX05DXW6Qb4Qt33wshuqU1kFNNdo7laG1tjQk3f3zVyn1qgBgDihXyprbk
 G7nZPuLhC9ItyFODOPg/QwMQJFYZtK4A1BAgZX+qH9rbfMOv2yhBWVyw9lzHUQzjNq4i
 A+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742422135; x=1743026935;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvlkhTWhAzJ84g1RHdy0S3etQzJbxZ8GWKau6gHnWHg=;
 b=BFhJgIf24rj9yEKe/Xpulke4IVwrOWQXTjMSAdglH8TEA8MPRISmt3QCwcJoYPv7ZB
 flDcu+Q8BIs7fIMPWjSJAxF79iVG6xzxVFKd6P9IxgvocG1iRs4wAZwvMb/coythSYzy
 QWuLBJFhSbctKPFObBDsrZBP+WoO8cdJ+MqZZjbX2AaFbk/JK/1W2JL4fj5l6IEDKSEk
 GqOBYSPHhfZSYlxQJgUhUgUpdedm6iz1ltkxqMokiTGMyE1lvIMPPx38WecU9BZZ9NuO
 lmhElRC93PZfAFIlPjBW5PU8wittH3bCehvcdUuO6MRRCuI9T/0sF+TLyGlZK315oFRE
 ZQsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUulXDA/rg5RGN3+eLZKIl1rqtv1hRRYc2V8UIW75FDITwens5cSZr95Db4tBBhkDNyxxaUo7XTliJSM32njw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy3RCEKZafIJNqrl7fynJddO8Ycfz5pUTKp6bNOEU5Bf3ckMXOx
 eHBERW2w8Kc1pz98cnTk/qf/j8Abe6k3X0LcPdTgg6e31QtpfjgY7yYZMZibLHmxVFi72/Ae4Mq
 /ULdHUuJgp+OkXib1CJgtrPh6A1ep25d3o8E09nILvUIZOORyX+yC
X-Gm-Gg: ASbGncvltxZZdeX2G6/2BD1IQFJQcLeQ7Aa2VY0tsPi26HbmpkoEX/Th5dXW1zI7tvV
 aNT4VqTUo+cpKaY6IMDbu7mvjBVhTiRTAYuhZRjB0CqP5nWPIXMEPbJ58j9qlLRiBvLoGpSOrkL
 q5UhzacMLyacKx5dTSokjR5+TEoLgTaxOfpdd9e1fnKWVMHzD+jZ8CePA=
X-Google-Smtp-Source: AGHT+IG2d+8g4IUkmFtoj3fmX44ifjbLGO5wXGctt+Jqz4ODulKjbhb9daWIwSytvDrBuPXKFP8u73NR9yD8Vp49HwE=
X-Received: by 2002:a05:6102:5488:b0:4b2:c391:7d16 with SMTP id
 ada2fe7eead31-4c4fcd4b4e4mr773647137.7.1742418676277; Wed, 19 Mar 2025
 14:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250319163341.2123-2-thorsten.blum@linux.dev>
In-Reply-To: <20250319163341.2123-2-thorsten.blum@linux.dev>
Date: Wed, 19 Mar 2025 14:11:04 -0700
X-Gm-Features: AQ5f1JoN2uPsFw29iHN393K75wq6oD6Cg3O8Y2bxqAO1B28vC7GlbD6DEjlXh8k
Message-ID: <CAFhGd8rH1PcjjRyKzaC9CgvFgA4_uEwvsCq-4v98bmVbqi=o2A@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Mar 19, 2025 at 9:35 AM Thorsten Blum <thorsten.blum@linux.dev>
    wrote: > > If the destination buffer has a fixed length, strscpy() automatically
    > determines the size of the destination buff [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.181 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.222.181 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.222.181 listed in sa-trusted.bondedsender.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1tv1b0-0005RN-EE
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Remove optional size arguments
 from strscpy() calls
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
From: Justin Stitt via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Justin Stitt <justinstitt@google.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkLCBNYXIgMTksIDIwMjUgYXQgOTozNeKAr0FNIFRob3JzdGVuIEJsdW0gPHRob3JzdGVu
LmJsdW1AbGludXguZGV2PiB3cm90ZToKPgo+IElmIHRoZSBkZXN0aW5hdGlvbiBidWZmZXIgaGFz
IGEgZml4ZWQgbGVuZ3RoLCBzdHJzY3B5KCkgYXV0b21hdGljYWxseQo+IGRldGVybWluZXMgdGhl
IHNpemUgb2YgdGhlIGRlc3RpbmF0aW9uIGJ1ZmZlciB1c2luZyBzaXplb2YoKSBpZiB0aGUKPiBh
cmd1bWVudCBpcyBvbWl0dGVkLiBUaGlzIG1ha2VzIHRoZSBleHBsaWNpdCBzaXplb2YoKSB1bm5l
Y2Vzc2FyeS4KPgo+IEZ1cnRoZXJtb3JlLCBDTURfQlVGTEVOIGlzIGVxdWFsIHRvIHNpemVvZihr
ZGJfcHJvbXB0X3N0cikgYW5kIGNhbiBhbHNvCj4gYmUgcmVtb3ZlZC4gUmVtb3ZlIHRoZW0gdG8g
c2hvcnRlbiBhbmQgc2ltcGxpZnkgdGhlIGNvZGUuCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMg
aW50ZW5kZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9yc3RlbiBCbHVtIDx0aG9yc3Rlbi5ibHVt
QGxpbnV4LmRldj4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYyB8IDQgKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMgYi9rZXJuZWwvZGVidWcva2RiL2tk
Yl9pby5jCj4gaW5kZXggNmE3N2YxYzc3OWM0Li45YjExYjEwYjEyMGMgMTAwNjQ0Cj4gLS0tIGEv
a2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYwo+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lv
LmMKPiBAQCAtMzM0LDcgKzMzNCw3IEBAIHN0YXRpYyBjaGFyICprZGJfcmVhZChjaGFyICpidWZm
ZXIsIHNpemVfdCBidWZzaXplKQo+ICAgICAgICAgICAgICAgICAqY3AgPSAnXDAnOwo+ICAgICAg
ICAgICAgICAgICBwX3RtcCA9IHN0cnJjaHIoYnVmZmVyLCAnICcpOwo+ICAgICAgICAgICAgICAg
ICBwX3RtcCA9IChwX3RtcCA/IHBfdG1wICsgMSA6IGJ1ZmZlcik7Cj4gLSAgICAgICAgICAgICAg
IHN0cnNjcHkodG1wYnVmZmVyLCBwX3RtcCwgc2l6ZW9mKHRtcGJ1ZmZlcikpOwo+ICsgICAgICAg
ICAgICAgICBzdHJzY3B5KHRtcGJ1ZmZlciwgcF90bXApOwo+ICAgICAgICAgICAgICAgICAqY3Ag
PSB0bXA7Cj4KPiAgICAgICAgICAgICAgICAgbGVuID0gc3RybGVuKHRtcGJ1ZmZlcik7Cj4gQEAg
LTQ1Miw3ICs0NTIsNyBAQCBzdGF0aWMgY2hhciAqa2RiX3JlYWQoY2hhciAqYnVmZmVyLCBzaXpl
X3QgYnVmc2l6ZSkKPiAgY2hhciAqa2RiX2dldHN0cihjaGFyICpidWZmZXIsIHNpemVfdCBidWZz
aXplLCBjb25zdCBjaGFyICpwcm9tcHQpCj4gIHsKPiAgICAgICAgIGlmIChwcm9tcHQgJiYga2Ri
X3Byb21wdF9zdHIgIT0gcHJvbXB0KQo+IC0gICAgICAgICAgICAgICBzdHJzY3B5KGtkYl9wcm9t
cHRfc3RyLCBwcm9tcHQsIENNRF9CVUZMRU4pOwo+ICsgICAgICAgICAgICAgICBzdHJzY3B5KGtk
Yl9wcm9tcHRfc3RyLCBwcm9tcHQpOwo+ICAgICAgICAga2RiX3ByaW50ZigiJXMiLCBrZGJfcHJv
bXB0X3N0cik7Cj4gICAgICAgICBrZGJfbmV4dGxpbmUgPSAxOyAgICAgICAvKiBQcm9tcHQgYW5k
IGlucHV0IHJlc2V0cyBsaW5lIG51bWJlciAqLwo+ICAgICAgICAgcmV0dXJuIGtkYl9yZWFkKGJ1
ZmZlciwgYnVmc2l6ZSk7CgpUaGlzIG1hdGNoZXMgdGhlIHBhdHRlcm4gb2YgcmVwbGFjZW1lbnRz
IEkndmUgZG9uZSBpbiB0aGUgcGFzdCwgYWxsIGxvb2tzIGdvb2QuCgpSZXZpZXdlZC1ieTogSnVz
dGluIFN0aXR0IDxqdXN0aW5zdGl0dEBnb29nbGUuY29tPgoKSnVzdGluCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
